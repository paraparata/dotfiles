local eslintLang = {
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	"vue",
}

local langLint = {}

for _, lang in pairs(eslintLang) do
	if not langLint[lang] then
		langLint[lang] = { "eslint" }
	end
	if not vim.tbl_contains(langLint[lang], "eslint") then
		table.insert(langLint[lang], "eslint")
	end
end

require("lint").linters_by_ft = langLint

local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function(args)
		local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })

		if vim.tbl_contains(js_filetypes, filetype) then
			if
				require("lspconfig.util").root_pattern(".eslintrc.json", "eslint.config.js", "eslint.config.mjs")(
					args.buf
				)
			then
				require("lint").try_lint()
			end
		else
			require("lint").try_lint()
		end
	end,
})
