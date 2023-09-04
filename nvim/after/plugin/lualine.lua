-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine")

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#e0af68',
  blue     = '#7dcfff',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#ff9e64',
  violet   = '#bb9af7',
  magenta  = '#c678dd',
  cyan     = '#b4f9f8',
  red      = '#f7768e',
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.orange, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.darkblue } },
			active = { c = { fg = colors.bg, bg = colors.green } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local ins_left = function(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local ins_right = function(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	-- mode component
	"mode",
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { fg = "#1f2335", bg = mode_color[vim.fn.mode()], gui = "bold" }
	end,
	padding = { right = 1, left = 1 },
})

ins_left({
	-- filesize component
	"filesize",
	cond = conditions.buffer_not_empty and conditions.hide_in_width,
	padding = { left = 1, right = 0 },
})

--ins_left({
--	"buffers",
--	show_filename_only = true,
--	hide_filename_extension = true,
--	padding = { left = 1, right = 0 },
--	buffers_color = {
--		active = "lualine_c_active", -- Color for active buffer.
--		inactive = "lualine_c_inactive", -- Color for inactive buffer.
--	},
--	symbols = {
--		alternate_file = "",
--	},
--	mode = 4,
--	fmt = function(s)
--		return string.gsub(s, " ", "-")
--	end,
--	cond = conditions.hide_in_width and conditions.buffer_not_empty,
--})

ins_left({
	"filename",
  symbols = { modified = '[⊚]'},
	padding = { left = 1, right = 0 },
})

ins_left({
	function()
		return "on"
	end,
	padding = { left = 1, right = 0 },
	cond = conditions.check_git_workspace,
})

ins_left({
	"branch",
	icon = "",
	color = { fg = colors.violet, gui = "bold" },
	padding = { left = 1, right = 0 },
})

ins_left({
	"diff",
	-- Is it me or the symbol for modified is really weird
	symbols = { added = " ", modified = "柳 ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width and conditions.buffer_not_empty,
	padding = { left = 1, right = 0 },
})

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
	padding = 1,
	cond = conditions.hide_in_width and conditions.buffer_not_empty,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
--ins_left {
--  function()
--    return '%='
--  end,
--}

ins_right({
	"location",
	cond = conditions.buffer_not_empty,
	padding = { left = 1, right = 0 },
})

-- ins_right {
--   -- Lsp server name .
--   function()
--     local msg = 'No Lsp'
--     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--       return msg
--     end
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         return client.name
--       end
--     end
--     return msg
--   end,
--   icon = '',
--   color = { fg = '#ffffff', gui = 'bold' },
--   padding = { left = 1, right = 0 },
--   cond = conditions.hide_in_width,
-- }

-- Add components to right sections
ins_right({
	"o:encoding", -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = conditions.hide_in_width and conditions.buffer_not_empty,
	color = { fg = colors.green, gui = "bold" },
	padding = { left = 1, right = 0 },
})

ins_right({
	"filetype",
	fmt = string.lower,
	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
	color = { fg = colors.green, gui = "bold" },
	padding = { left = 1, right = 0 },
	cond = conditions.buffer_not_empty,
})

ins_right({
	function()
		return "🌼"
	end,
	padding = { left = 1, right = 0 },
})

-- ins_right {
--   function()
--     return '▊'
--   end,
--   color = { fg = colors.blue },
--   padding = { left = 1 },
-- }

-- Now don't forget to initialize lualine
lualine.setup(config)
