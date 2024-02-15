require("kanagawa").setup({
	compile = false, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = {
		-- https://github.com/rebelot/kanagawa.nvim/blob/master/lua/kanagawa/themes.lua
		theme = {
			wave = {
				ui = {
					bg_gutter = "#16161C",
					bg_dim = "#0A0C10",
					bg = "#16161C",
				},
			},
		},
	},
})

vim.cmd("colorscheme kanagawa")
vim.cmd("hi MsgArea guibg=#0d0c0c")
