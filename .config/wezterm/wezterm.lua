local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- config.color_scheme = 'MaterialDark'
config.color_scheme = 'Sonokai (Gogh)'

config.font = wezterm.font { family = 'Berkeley Mono', weight = 'Regular' }
config.font_size = 11

config.window_frame = {
  font = wezterm.font { family = 'Berkeley Mono', weight = 'Bold' },
  font_size = 10,
}

wezterm.on('update-status', function(window)
  -- Grab the utf8 character for the "powerline" left facing
  -- solid arrow.
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Grab the current window's configuration, and from it the
  -- palette (this is the combination of your chosen colour scheme
  -- including any overrides).
  local color_scheme = window:effective_config().resolved_palette
  local bg = color_scheme.background
  local fg = color_scheme.foreground

  window:set_right_status(wezterm.format({
    -- First, we draw the arrow...
    { Background = { Color = 'none' } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    -- Then we draw our text
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. wezterm.hostname() .. ' ' },
  }))
end)

config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.audible_bell = "Disabled"
config.line_height = 1

-- Use tmux leader, should probably not reuse this but muscle memory...
config.leader = { key="b", mods="CTRL", timeout_milliseconds = 1000 }
config.keys = {
  {
    key = 'p',
    mods = "LEADER|CTRL",
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key = 't',
    mods = "LEADER",
    action = wezterm.action.ShowTabNavigator,
  },
  {
    -- leader passthrough
    key = 'b',
    mods = "LEADER|CTRL",
    action = wezterm.action.SendKey { key = 'b', mods = 'CTRL' },
  },
  {
    key = '%',
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '"',
    mods = "LEADER",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'h',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection('Left')
  },
  {
    key = 'j',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection('Down')
  },
  {
    key = 'k',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection('Up')
  },
  {
    key = 'l',
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection('Right')
  },
  {
    key = 'l',
    mods = "LEADER|CTRL",
    action = wezterm.action.ActivatePaneDirection('Right')
  },
  {
    key = 'c',
    mods = "LEADER",
    action = wezterm.action.SpawnTab("CurrentPaneDomain")
  },
  {
    key = 'p',
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = 'n',
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = '[',
    mods = "LEADER",
    action = wezterm.action.ActivateCopyMode
  },
  {
    key = 'z',
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState,
  },
}

return config
