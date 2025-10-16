local M = {}

local wezterm = require("wezterm")

function M.table_find(tbl, val)
  for i, v in ipairs(tbl) do
    if v == val then
      return i
    end
  end
end

function M.is_shell(process)
  local name = string.match(process, "[^/\\]+$") or process

  return M.table_find({ "bash", "zsh", "fish", "sh", "ksh", "dash" }, name)
end

function M.get_mime(path)
  local ok, stdout, _ = wezterm.run_child_process({
    "file",
    "--brief",
    "--mime-type",
    path,
  })

  return ok, stdout
end

return M
