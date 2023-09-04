local status, comment = pcall(require, "Comment")
if not status then
	return
end

comment.setup({
	toggler = {
		---Line-comment toggle keymap
		line = "<leader>/",
		---Block-comment toggle keymap
		block = "gbc",
	},
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment keymap
		line = "gc",
		---Block-comment keymap
		block = "<leader>,",
	},
	pre_hook = function(ctx)
		if vim.bo.filetype == "typescriptreact" then
			local U = require("Comment.utils")

			local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

			local location = nil
			if ctx.ctype == U.ctype.blockwise then
				location = require("ts_context_commentstring.utils").get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location = require("ts_context_commentstring.utils").get_visual_start_location()
			end

			return require("ts_context_commentstring.internal").calculate_commentstring({
				key = type,
				location = location,
			})
		end
	end,
})
