local Util = require("tokyonight.util")
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
		comments = { italic = false },
		keywords = { italic = false },
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
	dim_inactive = true, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	on_colors = function(colors)
		colors.bg = "#16161C"
		colors.bg_dark = "#16161C"
		colors.red = "#de5971"
		colors.border_highlight = "#5A607F"
	end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	on_highlights = function(h, c)
		-- TreesitterContext
		h.TreesitterContext = {
			bg = "#16161C",
		}
		h.TreesitterContextSeparator = {
			fg = c.fg_gutter,
		}
		h.TreesitterContextLineNumber = {
			fg = c.fg_gutter,
			bg = "#16161C",
		}

		-- h.Cursor = { bg = c.orange }
		h.SpellBad = { sp = c.error, undercurl = false } -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		h.SpellCap = { sp = c.warning, undercurl = false } -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		h.SpellLocal = { sp = c.info, undercurl = false } -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		h.SpellRare = { sp = c.hint, undercurl = false }
		-- TS/TSX
		h["@tag.attribute.tsx"] = { fg = c.magenta }
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

		h.NvimTreeWindowPicker = {
			fg = c.black,
			bg = c.purple,
		}
		-- Telescope
		-- h.TelescopeBorder = {
		-- 	fg = "#5A607F",
		-- }

		-- Window
		-- h.TabLine = { fg = c.comment, bg = "#000000" }
		h.TabLineSel = { fg = c.purple }
		-- h.TabLineFill = { bg = "#000000" }
		h.NormalFloat = { bg = c.bg_dark }

		h.LspSignWarn = { bg = Util.darken(c.yellow, 0.1), fg = c.yellow }
		h.LspSignError = { bg = Util.darken(c.red, 0.1), fg = c.red }
		h.LspSignInfo = { bg = Util.darken(c.blue, 0.1), fg = c.blue }
		h.LspSignHint = { bg = Util.darken("#58B99D", 0.1), fg = "#58B99D" }
	end,
})

-- require("poimandres").setup({})

vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme kanagawa")
vim.cmd("hi MsgArea guibg=#0d0c0c")
