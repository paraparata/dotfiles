-- Eviline config for lualine
-- Author: paraprata
-- Credit: glepnir
local lualine = require("lualine")

local colors = {
	bg = "#16161C",
	fg = "#787c99",
	disabled = "#717174",
	yellow = "#e0af68",
	blue = "#7dcfff",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#ff9e64",
	violet = "#bb9af7",
	magenta = "#c678dd",
	cyan = "#b4f9f8",
	red = "#f7768e",
}

local buffer_not_empty = function()
	return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
end
local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end
local check_git_workspace = function()
	local filepath = vim.fn.expand("%:p:h")
	local gitdir = vim.fn.finddir(".git", filepath .. ";")
	return gitdir and #gitdir > 0 and #gitdir < #filepath
end
local check_wip = function()
	local is_git = check_git_workspace()
	if is_git == false then
		return false
	end
	local out = vim.fn.system("git rev-list HEAD -1 --grep=wip: --count")
	local val = false
	if out == "1\n" then
		val = true
	end
	return val
end

local config = {
	options = {
		component_separators = "",
		section_separators = "",
		theme = {
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.disabled, bg = colors.darkblue } },
			active = { c = { fg = colors.bg, bg = colors.bg } },
		},
		globalstatus = true,
	},
	sections = {
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
	"mode",
	color = function()
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
	"filesize",
	cond = buffer_not_empty and hide_in_width,
	padding = { left = 1, right = 0 },
})

ins_left({
	function()
		local parent_folder = vim.fn.substitute(vim.fn.getcwd(), "^.*/", "", "")
		return parent_folder .. "#"
	end,
	padding = { left = 1, right = 0 },
	cond = hide_in_width,
})

ins_left({
	"filename",
	symbols = { modified = "[⊚]", unnamed = "[Scratch]", new = "[⚹]" },
	padding = { left = 0, right = 0 },
	cond = hide_in_width,
})

ins_left({
	function()
		return "on"
	end,
	padding = { left = 1, right = 1 },
	cond = check_git_workspace,
})
--
-- ins_left({
-- 	function()
-- 		return check_wip() and "WIP" or ""
-- 	end,
-- 	color = { fg = colors.bg, bg = colors.orange, gui = "bold" },
-- })

ins_left({
	"branch",
	icon = "",
	fmt = function(display_string, context)
		local branch = display_string
		if branch == "" then
			return ""
		end

		if #display_string > 20 then
			branch = display_string:sub(1, 25) .. "..."
		end

		local is_wip = check_wip() and "WIP" or ""
		return is_wip .. "  " .. branch
	end,
	color = function()
		return {
			fg = check_wip() and colors.bg or colors.fg,
			bg = check_wip() and colors.orange or colors.bg,
			gui = "bold",
		}
	end,
	padding = { left = 0, right = 1 },
})

ins_left({
	"diff",
	symbols = { added = " ", modified = "▣ ", removed = " " },
	diff_color = {
		added = { fg = colors.fg },
		modified = { fg = colors.fg },
		removed = { fg = colors.fg },
	},
	cond = hide_in_width and buffer_not_empty,
	padding = { left = 1, right = 0 },
})

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	-- diagnostics_color = {
	-- 	color_error = { fg = colors.red },
	-- 	color_warn = { fg = colors.fg },
	-- 	color_info = { fg = colors.fg },
	-- },
	colored = false,
	padding = 1,
	cond = hide_in_width and buffer_not_empty,
})

ins_right({
	"location",
	cond = buffer_not_empty,
	padding = { left = 1, right = 0 },
})

ins_right({
	"o:encoding", -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = hide_in_width or buffer_not_empty,
	padding = { left = 1, right = 0 },
})

ins_right({
	"filetype",
	fmt = string.lower,
	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
	padding = { left = 1, right = 0 },
	cond = buffer_not_empty,
})

ins_right({
	function()
		return check_wip() and "🚧" or "🌼"
	end,
	padding = { left = 1, right = 0 },
})

lualine.setup(config)
