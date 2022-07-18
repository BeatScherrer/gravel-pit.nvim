local colors = require("gravel_pit.colors")

local style = "DARK"

return {
	normal = {
		a = { bg = colors[style].black, fg = colors[style].fg, gui = "bold" },
		b = { bg = colors[style].comments, fg = colors[style].black },
		c = { bg = colors[style].black, fg = colors[style].fg },
	},
	insert = {
		a = { bg = colors[style].green, fg = colors[style].black, gui = "bold" },
		b = { bg = colors[style].comments, fg = colors[style].black },
		c = { bg = colors[style].black, fg = colors[style].white },
	},
	visual = {
		a = { bg = colors[style].yellow, fg = colors[style].black, gui = "bold" },
		b = { bg = colors[style].comments, fg = colors[style].black },
		c = { bg = colors[style].black, fg = colors[style].white },
	},
	replace = {
		a = { bg = colors[style].blue, fg = colors[style].bg, gui = "bold" },
		b = { bg = colors[style].comments, fg = colors[style].black },
		c = { bg = colors[style].black, fg = colors[style].white },
	},
	command = {
		a = { bg = colors[style].magenta, fg = colors[style].black, gui = "bold" },
		b = { bg = colors[style].comments, fg = colors[style].black },
		c = { bg = colors[style].black, fg = colors[style].white },
	},
	inactive = {
		a = { bg = colors[style].darkgray, fg = colors[style].gray, gui = "bold" },
		b = { bg = colors[style].darkgray, fg = colors[style].gray },
		c = { bg = colors[style].darkgray, fg = colors[style].gray },
	},
}
