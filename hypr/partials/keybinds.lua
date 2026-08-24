local programs = require("partials.programs")
local mainMod = "SUPER"

--- @param firstKey string
--- @param secondKey ?string
--- @return string
local function withSuper(firstKey, secondKey)
	if secondKey then
		return mainMod .. " + " .. firstKey .. " + " .. secondKey
	end

	return mainMod .. " + " .. firstKey
end

for i = 1, 10 do
	local key = i % 10
	hl.bind(withSuper(tostring(key)), hl.dsp.focus({ workspace = i }))
	hl.bind(withSuper("SHIFT", tostring(key)), hl.dsp.window.move({ workspace = i, follow = true }))
end

hl.bind(withSuper("F"), hl.dsp.window.fullscreen(), { description = "Toggle fullscreen" })
hl.bind(withSuper("C"), hl.dsp.window.close(), { description = "Gracefully close active window" })
hl.bind(withSuper("SHIFT", "C"), hl.dsp.window.kill(), { description = "Kill active window" })
hl.bind(withSuper("V"), hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(withSuper("SHIFT", "H"), hl.dsp.window.move({ direction = "l" }))
hl.bind(withSuper("SHIFT", "J"), hl.dsp.window.move({ direction = "d" }))
hl.bind(withSuper("SHIFT", "K"), hl.dsp.window.move({ direction = "u" }))
hl.bind(withSuper("SHIFT", "L"), hl.dsp.window.move({ direction = "r" }))
hl.bind(withSuper("mouse:272"), hl.dsp.window.drag())
hl.bind(withSuper("mouse:273"), hl.dsp.window.resize())

hl.bind(withSuper("H"), hl.dsp.focus({ direction = "l" }))
hl.bind(withSuper("J"), hl.dsp.focus({ direction = "d" }))
hl.bind(withSuper("K"), hl.dsp.focus({ direction = "u" }))
hl.bind(withSuper("L"), hl.dsp.focus({ direction = "r" }))
hl.bind(withSuper("TAB"), hl.dsp.focus({ workspace = "+1" }))
hl.bind(withSuper("SHIFT", "TAB"), hl.dsp.focus({ workspace = "-1" }))

hl.bind(withSuper("Q"), hl.dsp.exec_cmd(programs.terminal.cmd), { description = "Open Kitty" })
hl.bind(withSuper("B"), hl.dsp.exec_cmd(programs.browser.cmd), { description = "Open Brave" })
hl.bind(withSuper("R"), hl.dsp.exec_cmd(programs.menu.cmd), { description = "Open Rofi" })
hl.bind(withSuper("SHIFT", "W"), hl.dsp.exec_raw("bash ~/dotfiles/custom/scripts/toggle-waybar.sh"))
hl.bind(
	withSuper("SHIFT", "S"),
	hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'),
	{ description = "Screenshot", locked = true }
)
hl.bind(withSuper("SHIFT", "L"), hl.dsp.exec_cmd("hyprlock"), { description = "Lock the session", locked = true })
hl.bind(
	withSuper("XF86AudioRaiseVolume"),
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ description = "Raise the volume by 5%", repeating = true }
)
hl.bind(
	withSuper("XF86AudioLowerVolume"),
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"),
	{ description = "Lower the volume by 5%", repeating = true }
)
hl.bind(
	withSuper("XF86AudioMute"),
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ description = "Toggle audio mute", locked = true }
)
hl.bind(
	withSuper("XF86AudioMicMute"),
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ description = "Toggle mic mute", locked = true }
)
hl.bind(
	withSuper("SHIFT", "XF86MonBrightnessDown"),
	hl.dsp.exec_cmd("brightnessctl s 0%"),
	{ description = "Minimize the brightness", locked = true }
)
hl.bind(
	withSuper("SHIFT", "XF86MonBrightnessUp"),
	hl.dsp.exec_cmd("brightnessctl s 100%"),
	{ description = "Maximize the brightness", locked = true }
)
hl.bind(
	withSuper("XF86AudioPrev"),
	hl.dsp.exec_cmd("playerctl previous"),
	{ description = "Rewind or play previous track", locked = true }
)
hl.bind(withSuper("XF86AudioNext"), hl.dsp.exec_cmd("playerctl next"), { description = "Skip track", locked = true })
hl.bind(
	withSuper("XF86AudioPlay"),
	hl.dsp.exec_cmd("playerctl play-pause"),
	{ description = "Pause track", locked = true }
)
hl.bind(
	withSuper("XF86AudioPause"),
	hl.dsp.exec_cmd("playerctl play-pause"),
	{ description = "Pause track", locked = true }
)

hl.bind(withSuper("XF86MonBrightnessDown"), function()
	hl.dsp.exec_cmd("brightnessctl s 5%-")
	hl.dsp.exec_raw("bash ~/dotfiles/custom/scripts/brightness-noti.sh")
end, { description = "Lower the brightness by 5%", repeating = true })
hl.bind(withSuper("XF86MonBrightnessUp"), function()
	hl.dsp.exec_cmd("brightnessctl s 5%+")
	hl.dsp.exec_raw("bash ~/dotfiles/custom/scripts/brightness-noti.sh")
end, { description = "Raise the brightness by 5%", repeating = true })
