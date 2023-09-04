local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		file_ignore_patterns = { "^.git/" },
		path_display = {
			shorten = { len = 3, exclude = { 1, -1, -2 } },
		},
	},
	pkickers = {
		find_files = {
			theme = "dropdown",
		},
	},
})

vim.keymap.set("n", "<leader>pf", function()
	builtin.find_files({ hidden = true })
end, {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>pb", function()
	builtin.buffers({ sort_mru = true })
end, {})
