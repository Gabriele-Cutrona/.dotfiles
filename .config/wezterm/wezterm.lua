local wezterm = require("wezterm")
local act = wezterm.action

return {
	font = wezterm.font("JetBrainsMono Nerd Font"),
	color_scheme = "catppuccin-mocha",
	font_size = 14,
	wezterm.on("toggle-tabbar", function(window, _)
		local overrides = window:get_config_overrides() or {}
		if overrides.enable_tab_bar == false then
			wezterm.log_info("tab bar shown")
			overrides.enable_tab_bar = true
		else
			wezterm.log_info("tab bar hidden")
			overrides.enable_tab_bar = false
		end
		window:set_config_overrides(overrides)
	end),
	window_background_opacity = 0.7,

	leader = { key = "b", mods = "CTRL" },
	hide_tab_bar_if_only_one_tab = true,
	keys = {
		{ key = "v", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "h", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

		{ key = "f", mods = "LEADER", action = "TogglePaneZoomState" },

		{ key = "h", mods = "CTRL", action = act({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "CTRL", action = act({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "CTRL", action = act({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "CTRL", action = act({ ActivatePaneDirection = "Right" }) },

		{ key = "0", mods = "LEADER", action = act({ ActivateTab = 0 }) },
		{ key = "1", mods = "LEADER", action = act({ ActivateTab = 1 }) },
		{ key = "2", mods = "LEADER", action = act({ ActivateTab = 2 }) },
		{ key = "3", mods = "LEADER", action = act({ ActivateTab = 3 }) },
		{ key = "4", mods = "LEADER", action = act({ ActivateTab = 4 }) },
		{ key = "5", mods = "LEADER", action = act({ ActivateTab = 5 }) },
		{ key = "6", mods = "LEADER", action = act({ ActivateTab = 6 }) },
		{ key = "7", mods = "LEADER", action = act({ ActivateTab = 7 }) },
		{ key = "8", mods = "LEADER", action = act({ ActivateTab = 8 }) },
		{ key = "9", mods = "LEADER", action = act({ ActivateTab = 9 }) },

		{ key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },
      
		{ key = "t", mods = "LEADER", action = act.EmitEvent("toggle-tabbar") },
	},
}
