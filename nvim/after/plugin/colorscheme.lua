-- require("kanagawa").setup({
-- 	compile = true, -- enable compiling the colorscheme
-- 	undercurl = false, -- enable undercurls
-- 	commentStyle = { italic = true },
-- 	functionStyle = {},
-- 	keywordStyle = { italic = false },
-- 	statementStyle = { bold = true },
-- 	typeStyle = {},
-- 	transparent = false, -- do not set background color
-- 	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
-- 	terminalColors = true, -- define vim.g.terminal_color_{0,17}
-- 	theme = "wave",
-- 	colors = {
-- 		-- https://github.com/rebelot/kanagawa.nvim/blob/master/lua/kanagawa/themes.lua
-- 		theme = {
-- 			wave = {
-- 				ui = {
-- 					bg_gutter = "#16161C",
-- 					bg_dim = "#0A0C10",
-- 					bg = "#16161C",
-- 				},
-- 			},
-- 		},
-- 	},
-- })

-- require("catppuccin").setup({
-- 	flavour = "mocha", -- latte, frappe, macchiato, mocha
-- 	transparent_background = false, -- disables setting the background color.
-- 	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
-- 	term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
-- 	dim_inactive = {
-- 		enabled = false, -- dims the background color of inactive window
-- 	},
-- 	no_italic = false, -- Force no italic
-- 	no_bold = false, -- Force no bold
-- 	no_underline = false, -- Force no underline
-- 	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
-- 		comments = { "italic" }, -- Change the style of comments
-- 		conditionals = {},
-- 		loops = {},
-- 		functions = {},
-- 		keywords = {},
-- 		strings = {},
-- 		variables = {},
-- 		numbers = {},
-- 		booleans = {},
-- 		properties = {},
-- 		types = {},
-- 		operators = {},
-- 		-- miscs = {}, -- Uncomment to turn off hard-coded styles
-- 	},
-- 	color_overrides = {
-- 		all = {
-- 			-- surface0 = "#3e4451",
-- 			-- surface1 = "#545862",
-- 			-- surface2 = "#565c64",
-- 			-- text = "#abb2bf",
-- 			-- rosewater = "#b6bdca",
-- 			-- lavender = "#c8ccd4",
-- 			-- red = "#e06c75",
-- 			-- peach = "#d19a66",
-- 			-- yellow = "#e5c07b",
-- 			-- green = "#98c379",
-- 			-- teal = "#56b6c2",
-- 			-- blue = "#61afef",
-- 			-- mauve = "#c678dd",
-- 			-- flamingo = "#be5046",
-- 			--
-- 			-- -- now patching extra palettes
-- 			-- maroon = "#e06c75",
-- 			-- sky = "#d19a66",
-- 			--
-- 			-- -- extra colors not decided what to do
-- 			-- pink = "#F5C2E7",
-- 			-- sapphire = "#74C7EC",
-- 			--
-- 			-- subtext1 = "#BAC2DE",
-- 			-- subtext0 = "#A6ADC8",
-- 			-- overlay2 = "#9399B2",
-- 			-- overlay1 = "#7F849C",
-- 			-- overlay0 = "#6C7086",
-- 			--
-- 			base = "#16161C",
-- 			mantle = "#16161C",
-- 			crust = "#16161C",
-- 			-- 		rosewater = "#efc9c2",
-- 			-- 		flamingo = "#ebb2b2",
-- 			-- 		pink = "#f2a7de",
-- 			-- 		mauve = "#b889f4",
-- 			-- 		red = "#ea7183",
-- 			-- 		maroon = "#ea838c",
-- 			-- 		peach = "#f39967",
-- 			-- 		yellow = "#eaca89",
-- 			-- 		green = "#96d382",
-- 			-- 		teal = "#78cec1",
-- 			-- 		sky = "#91d7e3",
-- 			-- 		sapphire = "#68bae0",
-- 			-- 		blue = "#739df2",
-- 			-- 		lavender = "#a0a8f6",
-- 			-- 		text = "#b5c1f1",
-- 			-- 		subtext1 = "#a6b0d8",
-- 			-- 		subtext0 = "#959ec2",
-- 			-- 		overlay2 = "#848cad",
-- 			-- 		overlay1 = "#717997",
-- 			-- 		overlay0 = "#63677f",
-- 			-- 		surface2 = "#505469",
-- 			-- 		surface1 = "#3e4255",
-- 			-- 		surface0 = "#2c2f40",
-- 		},
-- 	},
-- 	custom_highlights = function(c)
-- 		return {
-- 			["@tag.attribute.tsx"] = { fg = c.mauve },
-- 			["@tag.tsx"] = { fg = c.red, bold = true },
-- 			["@type.tsx"] = { fg = c.text },
-- 			["@comment"] = { fg = c.surface1, style = { "italic" } },
-- 			TelescopeBorder = { fg = c.surface1 },
-- 		}
-- 	end,
-- 	integrations = {
-- 		cmp = true,
-- 		gitsigns = true,
-- 		nvimtree = true,
-- 		treesitter = true,
-- 		telescope = true,
-- 	},
-- })

require("tokyonight").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	light_style = "day", -- The theme is used when the background is set to light
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		background = "dark", -- style for sidebars, see below
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = false, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	on_colors = function(colors)
		colors.bg = "#16161C"
		colors.bg_dark = "#16161C"
	end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	on_highlights = function(h, c)
		-- TS/TSX
		h["@tag.attribute.tsx"] = { fg = c.purple }
		h["@type.tsx"] = { fg = c.fg_dark }
		h["@lsp.type.type.typescript"] = { fg = c.fg_dark }
		h["@lsp.type.type.typescriptreact"] = { fg = c.fg_dark }
		h["@lsp.type.namespace.typescriptreact"] = { fg = c.fg_dark }
		h["@lsp.type.interface.typescriptreact"] = { fg = c.fg_dark }
		-- h["@lsp.mod.declaration.typescript"] = { fg = c.fg_dark }
		h["@lsp.mod.defaultLibrary.typescript"] = { fg = c.fg_dark }
		-- h["@lsp.type.property.typescriptreact"] = { fg = c.fg_dark }
		-- h["@lsp.typemod.property.declaration.typescriptreact"] = { fg = c.fg_dark }
		h["@lsp.type.interface.typescript"] = { fg = c.fg_dark }
		-- h["@lsp.typemod.parameter.declaration.typescriptreact"] = { fg = c.fg_dark }
		-- h["@lsp.type.parameter.typescriptreact"] = { fg = c.fg_dark }

		-- Telescope
		h.TelescopeBorder = {
			fg = "#5A607F",
		}

		-- Window
		h.TabLineSel = { fg = c.purple }
	end,
})

vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme kanagawa")
vim.cmd("hi MsgArea guibg=#0d0c0c")
