local util = require("lua/util")
local wezterm = require("wezterm")

-- [[ constants ]]
-- padding
local padding_on = { left = 12, right = 12, top = 8, bottom = 8 }
local padding_off = { left = 0, right = 0, top = 0, bottom = 0 }

-- font
local font = wezterm.font_with_fallback({
  { family = "JetBrains Mono" },
  { family = "Symbols Nerd Font", scale = 0.88 },
  { family = "Noto Color Emoji" },
  { family = "DejaVu Sans Mono" },
})

-- [[ config ]]
local config = wezterm.config_builder()

-- general
config.webgpu_power_preference = "HighPerformance"
config.enable_wayland = false

-- font
config.bidi_enabled = true
config.font = font
config.font_size = 10.2

-- theme
config.term = "wezterm"
config.color_scheme = "onedark-nvim"

-- tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 24

-- window
config.enable_scroll_bar = false
config.window_background_opacity = 0.90
config.window_frame = { font = font, font_size = 10.0 }
config.window_padding = padding_on

-- [[ events ]]

-- toggle padding on demand
wezterm.on("toggle-padding", function(window, _)
  local overrides = window:get_config_overrides() or {}

  if wezterm.GLOBAL.has_padding == false then
    overrides.window_padding = padding_on
    wezterm.GLOBAL.has_padding = true
  else
    overrides.window_padding = padding_off
    wezterm.GLOBAL.has_padding = false
  end

  window:set_config_overrides(overrides)
end)

-- cd into clicked directory
wezterm.on("open-uri", function(_, pane, uri)
  if uri:find("^file:") == 1 and not pane:is_alt_screen_active() then
    local url = wezterm.url.parse(uri)

    if util.is_shell(pane:get_foreground_process_name()) then
      local ok, mime = util.get_mime(url.file_path)
      if ok then
        if mime:find("directory") then
          pane:send_text(wezterm.shell_join_args({ "cd", url.file_path }) .. "\r")
        else
          pane:send_text(wezterm.shell_join_args({ "xdg-open", url.file_path }) .. "\r")
        end
        return false
      end
    end
  end
end)

-- [[ key bindings ]]
config.keys = {
  -- toggle padding
  {
    key = "P",
    mods = "CTRL|SHIFT",
    action = wezterm.action.EmitEvent("toggle-padding"),
  },

  -- nagivate tabs
  {
    key = "{",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = "}",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivateTabRelative(1),
  },

  -- move tabs
  {
    key = "{",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = "}",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.MoveTabRelative(1),
  },

  -- navigate panes
  {
    key = "H",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "L",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "K",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "J",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },

  -- resize panes
  {
    key = "H",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "L",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
  },
  {
    key = "K",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
  },
  {
    key = "J",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
  },

  -- vertical split
  {
    key = "_",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },

  -- horizontal split
  {
    key = "|",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal,
  },
}

return config
