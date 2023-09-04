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

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
