local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		file_ignore_patterns = { "^.git/" },
		prompt_prefix = "▷  ",
		selection_caret = "▶  ",
		path_display = {
			shorten = { len = 3, exclude = { 1, -1, -2 } },
		},
		winblend = 8,
		dynamic_preview_title = true,
	},
})

vim.keymap.set("n", "<leader>pf", function()
	builtin.find_files({ hidden = true })
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
vim.keymap.set("n", "<leader>ps", function()
	builtin.git_status(require("telescope.themes").get_ivy({ previewer = false }))
end, {})
