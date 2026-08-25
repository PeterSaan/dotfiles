hl.monitor({ output = "DP-1", mode = "3840x2560@144", position = "0x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", disabled = true })
hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })

hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		initial_workspace_tracking = true,
		force_default_wallpaper = false,
	},
	input = {
		numlock_by_default = true,
		kb_layout = "ee",
		kb_variant = "us",
		kb_model = "pc105",
	},
	cursor = {
		no_warps = true,
		no_hardware_cursors = true,
	},
})
