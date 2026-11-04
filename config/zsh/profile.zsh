# mpd vars
export MPD_PID="${XDG_RUNTIME_DIR}/mpd.pid"
export MPD_HOST="${XDG_RUNTIME_DIR}/mpd.socket"

# sdks
export VCPKG_ROOT="${HOME}/opt/vcpkg"

# home manager
if [ -f "~/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
  . "~/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi

# vim: ft=zsh sw=2 ts=2 et
