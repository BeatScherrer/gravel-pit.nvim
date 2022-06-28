local colors = require("gravel_pit.colors")

return {
	normal = {
		a = { bg = colors.black, fg = colors.fg, gui = "bold" },
		b = { bg = colors.cyan, fg = colors.bg },
		c = { bg = colors.black, fg = colors.white },
	},
	insert = {
		a = { bg = colors.green, fg = colors.black, gui = "bold" },
		b = { bg = colors.cyan, fg = colors.bg },
		c = { bg = colors.black, fg = colors.white },
	},
	visual = {
		a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
		b = { bg = colors.cyan, fg = colors.bg },
		c = { bg = colors.black, fg = colors.white },
	},
	replace = {
		a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
		b = { bg = colors.cyan, fg = colors.bg },
		c = { bg = colors.black, fg = colors.white },
	},
	command = {
		a = { bg = colors.magenta, fg = colors.black, gui = "bold" },
		b = { bg = colors.cyan, fg = colors.bg },
		c = { bg = colors.black, fg = colors.white },
	},
	inactive = {
		a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.gray },
		c = { bg = colors.darkgray, fg = colors.gray },
	},
}
