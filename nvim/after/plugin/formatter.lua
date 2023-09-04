-- Utilities for creating configurations
local util = require("formatter.util")

local vim = vim
local formatter = require("formatter")
local prettierConfig = function()
	return {
		exe = "prettier",
		args = { "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)) },
		stdin = true,
		try_node_modules = true,
	}
end

local formatterConfig = {
	lua = {
		-- "formatter.filetypes.lua" defines default configurations for the
		-- "lua" filetype
		require("formatter.filetypes.lua").stylua,

		-- You can also define your own configuration
		function()
			-- Supports conditional formatting
			if util.get_current_buffer_file_name() == "special.lua" then
				return nil
			end

			-- Full specification of configurations is down below and in Vim help
			-- files
			return {
				exe = "stylua",
				args = {
					"--search-parent-directories",
					"--stdin-filepath",
					util.escape_path(util.get_current_buffer_file_path()),
					"--",
					"-",
				},
				stdin = true,
			}
		end,
	},
	vue = {
		function()
			return {
				exe = "prettier",
				args = {
					"--stdin-filepath",
					vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
					"--single-quote",
					"--parser",
					"vue",
				},
				stdin = true,
			}
		end,
	},
	rust = {
		-- Rustfmt
		function()
			return {
				exe = "rustfmt",
				args = { "--emit=stdout" },
				stdin = true,
			}
		end,
	},
	swift = {
		-- Swiftlint
		function()
			return {
				exe = "swift-format",
				args = { vim.api.nvim_buf_get_name(0) },
				stdin = true,
			}
		end,
	},
	go = {
		-- Go fmt
		function()
			return {
				exe = "gofmt",
				stdin = true,
			}
		end,
	},
	["*"] = {
		-- require("formatter.filetypes.any").lsp_format,
		-- require('formatter.filetypes.any').remove_trailing_whitespace
	},
}
local commonFT = {
	"css",
	"scss",
	"html",
	"java",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"markdown",
	"markdown.mdx",
	"json",
	"yaml",
	"xml",
	"svg",
	"svelte",
}
for _, ft in ipairs(commonFT) do
	formatterConfig[ft] = { prettierConfig }
end
-- Setup functions
formatter.setup({
	logging = true,
	filetype = formatterConfig,
	log_level = 2,
})
vim.api.nvim_set_keymap("n", "<leader>f", "<CMD>Format<CR>", {})
