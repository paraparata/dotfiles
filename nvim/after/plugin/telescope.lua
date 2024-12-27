local telescope = require("telescope")
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")
local action_state = require("telescope.actions.state")

local dir_path = function(path)
	-- Match the path up to the last slash or backslash and return it
	local dir = path:match("(.*/)") or path:match("(.*\\)")
	return dir or "" -- Return an empty string if no directory is found
end

local open_or_cp = function(_, map)
	-- Open file in file manager
	map({ "i", "n" }, "<C-CR>", function()
		local file_path = vim.fn.getcwd() .. "/" .. action_state.get_selected_entry()[1]
		vim.cmd([[!open ]] .. file_path)
	end)

	-- Open directory of file in file manager
	map({ "i", "n" }, "<C-o>", function()
		local file_path = vim.fn.getcwd() .. "/" .. action_state.get_selected_entry()[1]
		vim.cmd([[!open ]] .. dir_path(file_path))
	end)

	-- Copy relative file path to os clipboard
	map("n", "yy", function()
		local rel_path = action_state.get_selected_entry()[1]
		vim.fn.setreg("+", rel_path)
	end)

	-- Copy absolute file path to os clipboard
	map("n", "YY", function()
		local file_path = vim.fn.getcwd() .. "/" .. action_state.get_selected_entry()[1]
		vim.fn.setreg("+", file_path)
	end)

	-- needs to return true if you want to map default_mappings and
	-- false if not
	return true
end

telescope.setup({
	defaults = {
		preview = {
			filesize_limit = 1, -- MB
		},
		file_ignore_patterns = { "^.git/" },
		prompt_prefix = "▷  ",
		selection_caret = "▶  ",
		path_display = {
			shorten = { len = 3, exclude = { 1, -1, -2 } },
		},
		winblend = 8,
		dynamic_preview_title = true,
	},
	pickers = {
		find_files = {
			attach_mappings = open_or_cp,
		},
	},
})

vim.keymap.set("n", "<leader>pf", function()
	builtin.find_files({ hidden = true })
end, {})
vim.keymap.set("n", "<leader>pF", function()
	builtin.find_files({ hidden = true, cwd = utils.buffer_dir() })
end, {})
vim.keymap.set("n", "<leader>pg", function()
	builtin.live_grep()
end, {})
vim.keymap.set("n", "<leader>pG", function()
	builtin.grep_string()
end)
vim.keymap.set("n", "<leader>pb", function()
	builtin.buffers({ sort_mru = true })
end, {})
vim.keymap.set("n", "<leader>po", function()
	builtin.lsp_document_symbols()
end, {})
vim.keymap.set("n", "<leader>pt", function()
	builtin.treesitter()
end, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.git_status(require("telescope.themes").get_ivy({ previewer = false }))
end, {})
