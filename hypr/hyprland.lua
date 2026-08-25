hl.config({
	decoration = {
		rounding = 8,
		rounding_power = 2.0,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
	},
	dwindle = {
		preserve_split = true,
		force_split = 2,
	},
	general = {
		border_size = 1,
		float_gaps = 0,
		gaps_in = 8,
		gaps_out = 15,
		gaps_workspaces = 0,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		layout = "dwindle",
		resize_on_border = true,
		extend_border_grab_area = 15, -- gaps_out + gaps_workspaces
		allow_tearing = false,
		no_focus_fallback = true,
	},
	master = {
		new_status = "master",
	},
	misc = {
		disable_hyprland_logo = false,
		force_default_wallpaper = false,
	},
})

require("partials.env-vars")
require("partials.animations")
require("partials.monitors")
require("partials.gestures")
require("partials.input")
require("partials.keybinds")
require("partials.autostart")
