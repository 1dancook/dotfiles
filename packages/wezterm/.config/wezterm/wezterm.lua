-- Import the wezterm module
local wezterm = require("wezterm")
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- TODO: full size the gui window

-- get the $PATH from my zsh
local function read_zsh_path()
	local file, err = io.open(wezterm.home_dir .. "/.zsh_path", "r") -- Open the file in read mode
	if not file then
		error("Could not open file: " .. err)
	end
	local line = file:read("*l") -- Read the first line from the file
	file:close()
	wezterm.log_info("PATH FROM FILE: " .. line)
	return line
end

config.set_environment_variables = {
	PATH = read_zsh_path(),
}

-- color scheme
-- config.color_scheme = 'Snazzy (base16)'
config.color_scheme = "tokyonight-storm"
local tab_bar_bg = wezterm.color.parse("black")

-- font
config.font = wezterm.font("JetBrains Mono")
config.font_size = 13
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- disable ligatures

-- tabbar
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.show_close_tab_button_in_tabs = false
config.show_new_tab_button_in_tab_bar = false
config.window_frame = {
	font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),

	font_size = 12.0,

	active_titlebar_bg = tab_bar_bg,

	inactive_titlebar_bg = tab_bar_bg,
}

config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = 0,
	bottom = 0,
}

config.colors = {
	split = "#5533ee",
	tab_bar = {
		inactive_tab_edge = tab_bar_bg,

		active_tab = {
			bg_color = "#444444",
			fg_color = "#cccccc",
		},
		inactive_tab = {
			bg_color = "#222222",
			fg_color = "#999999",
		},
	},
}

-- format tab titles
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, conf, hover, max_width)
	local title = tab_title(tab)
	local t = {}
	table.insert(t, { Text = " " .. (tab.tab_index + 1) .. " " .. title })
	if tab.active_pane.is_zoomed then
		table.insert(t, { Foreground = { AnsiColor = "Blue" } })
		table.insert(t, { Text = "  " })
	else
		table.insert(t, { Text = " " })
	end
	return wezterm.format(t)
end)

-- update right-status and left-status

wezterm.on("update-right-status", function(window, pane)
	window:set_left_status(wezterm.format({
		{ Background = { Color = tab_bar_bg } },
		{ Foreground = { Color = tab_bar_bg } },
		{
			Text = " ",
		},
	}))
	local s = {}
	table.insert(s, { Background = { Color = tab_bar_bg } })
	table.insert(s, { Foreground = { AnsiColor = "Blue" } })
	table.insert(s, { Text = "󰕮 " })
	table.insert(s, { Foreground = { AnsiColor = "White" } })
	table.insert(s, { Text = "" .. window:active_workspace() .. "" })
	table.insert(s, { Text = " " })
	table.insert(s, { Text = "[" .. #wezterm.mux.get_workspace_names() .. "]" })
	table.insert(s, { Text = " " })
	window:set_right_status(wezterm.format(s))
end)

-- keyboard shortcuts

config.keys = {
	-- pane splits
	{ mods = "SUPER", key = "\\", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "SUPER", key = "-", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- navigate tabs
	{ mods = "SUPER", key = "j", action = { ActivatePaneDirection = "Down" } },
	{ mods = "SUPER", key = "k", action = { ActivatePaneDirection = "Up" } },
	{ mods = "SUPER", key = "h", action = { ActivatePaneDirection = "Left" } },
	{ mods = "SUPER", key = "l", action = { ActivatePaneDirection = "Right" } },

	-- zoom pane
	{ mods = "SUPER", key = "f", action = wezterm.action.TogglePaneZoomState },

	-- resizing panes
	{ mods = "SUPER", key = "LeftArrow", action = { AdjustPaneSize = { "Left", 2 } } },
	{ mods = "SUPER", key = "RightArrow", action = { AdjustPaneSize = { "Right", 2 } } },
	{ mods = "SUPER", key = "UpArrow", action = { AdjustPaneSize = { "Up", 2 } } },
	{ mods = "SUPER", key = "DownArrow", action = { AdjustPaneSize = { "Down", 2 } } },

	-- close panes
	{ mods = "SUPER", key = "w", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

	-- close tabs
	{ mods = "SUPER", key = "W", action = wezterm.action.CloseCurrentTab({ confirm = true }) },

	-- search mode
	{ mods = "SUPER", key = "/", action = { Search = { CaseSensitiveString = "" } } },

	-- rename tab
	{
		mods = "SUPER",
		key = "r",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	-- rename workspace
	{
		mods = "SUPER",
		key = "R",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for workspace",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
				end
			end),
		}),
	},

	-- new workspace (prompt for name)
	{
		key = "N",
		mods = "SUPER",
		action = wezterm.action.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(
						wezterm.action.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},

	-- switch to workspace
	{ mods = "SUPER", key = "s", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },

	-- some programs, etc
	{
		mods = "SUPER",
		key = ",",
		action = wezterm.action.SpawnCommandInNewTab({ args = { "nvim", wezterm.config_file } }),
	},
	{ mods = "OPT", key = "J", action = wezterm.action.SpawnCommandInNewTab({ args = { "weztermjournal" } }) },
}

return config
