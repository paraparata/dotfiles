local M = {}

vim.api.nvim_set_hl(0, "WinBarPath", { fg = "#7C936E" })
vim.api.nvim_set_hl(0, "WinBarModified", { fg = "#F2A470" })

local isScratch = function(path)
	return path == "[Scratch]"
end

function M.eval()
	local parent_folder = vim.fn.substitute(vim.fn.getcwd(), "^.*/", "", "")
	local file_path = vim.api.nvim_eval_statusline("%f", {}).str
	local modified = vim.api.nvim_eval_statusline("%M", {}).str == "+" and " ⊚" or ""
	local path = isScratch(file_path) and parent_folder or file_path
	local isModified = isScratch(file_path) and "" or modified

	return "%#WinBarPath#%=" .. path .. "%*" .. "%#WinBarModified#" .. isModified .. "%=%*"
end

return M
