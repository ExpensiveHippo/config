local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'
--config.color_scheme = 'Cloud (terminal.sexy)'
--config.color_scheme = 'cyberpunk'
--config.color_scheme = 'Whimsy'
config.color_scheme = 'Ocean (dark) (terminal.sexy)'
--config.color_scheme = 'Belafonte Night'
config.default_prog = {'powershell.exe', '-NoLogo'}
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.window_decorations = 'RESIZE'
config.initial_cols = 80

config.keys = {
	{
		key= ']',
		mods = 'CTRL',
		action = act.AdjustPaneSize { 'Right', 5 },
	},
	{
		key = '[',
		mods = 'CTRL',
		action = act.AdjustPaneSize { 'Left', 5 },
	},
	{
		key = 'l',
		mods = 'CTRL|SHIFT',
		action = act.SplitPane { direction = 'Right' },
	},
	{
	key = 'h',
		mods = 'CTRL|SHIFT',
		action = act.SplitPane { direction = 'Left' },
	},
	{
		key = 'k',
		mods = 'CTRL|SHIFT',
		action = act.SplitPane { direction = 'Up' },
	},
	{
		key = 'j',
		mods = 'CTRL|SHIFT',
		action = act.SplitPane { direction = 'Down' },
	},
	{
		key = 'q',
		mods = 'CTRL|SHIFT',
		action = act.CloseCurrentPane { confirm = false },
	},
	{
		key = 'f',
		mods = 'CTRL|SHIFT',
		action = act.ToggleFullScreen,
	},
	{
		key = '0',
		mods = 'CTRL',
		action = act.PaneSelect,
	},
}

return config
