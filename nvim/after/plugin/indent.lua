-- vim.opt.list = true
-- vim.opt.listchars:append("space:∙")
vim.opt.listchars:append("eol:¬")

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#000000" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#000000" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#000000" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#000000" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#000000" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#000000" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#000000" })
end)

require("ibl").setup({
	indent = {
		char = "▏",
		highlight = highlight,
	},
	whitespace = {
		remove_blankline_trail = false,
	},
})
