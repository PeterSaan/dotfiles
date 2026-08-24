local programs = require("partials.programs")

hl.on("hyprland.start", function()
	hl.exec_cmd(programs.terminal.cmd)
	hl.exec_cmd(programs.browser.cmd)
end)
