require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "go", "elixir", "python", "c", "lua", "vim", "vimdoc", "query" },

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = function(lang, buf)
			local max_filesize = 1000 * 1024 -- 1 MB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},

	-- autotag = {
	-- 	enable = true,
	-- 	enable_rename = true,
	-- 	enable_close_on_slash = false,
	-- },
})
