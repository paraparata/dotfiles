-- empty setup using defaults
require("nvim-tree").setup({
	view = {
		width = 50,
	},
	renderer = {
		icons = {
			show = {
				git = false,
				modified = false,
				diagnostics = false,
			},
		},
	},
	update_focused_file = {
		enable = true,
		ignore_list = { "node_modules" },
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	filters = {
		exclude = { ".env" },
	},
})
