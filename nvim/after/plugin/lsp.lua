vim.lsp.enable({
	"zls",
	"html",
	"ts_ls",
	"gopls",
	"lua_ls",
	"sourcekit",
	"solargraph",
	"lua_ls",
	"clangd",
	"cssls",
})

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-;>"] = cmp.mapping.complete(),
	["<CR>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			if luasnip.expandable() then
				luasnip.expand()
			else
				cmp.confirm({
					select = true,
				})
			end
		else
			fallback()
		end
	end),
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.locally_jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, { "i", "s" }),
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.locally_jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- lsp key remap
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end)
		vim.keymap.set("n", "gx", function()
			vim.cmd([[split | lua vim.lsp.buf.definition()]])
		end)
		vim.keymap.set("n", "gv", function()
			vim.cmd([[vsplit | lua vim.lsp.buf.definition()]])
		end)
		vim.keymap.set("n", "gV", function()
			vim.cmd([[tab split | lua vim.lsp.buf.definition()]])
		end)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next()
		end)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev()
		end)
		vim.keymap.set("n", "<leader>cd", function()
			vim.diagnostic.goto_prev()
		end)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end)
		vim.keymap.set("i", "<C-Space>", "<C-x><C-o>")

		-- nvim-cmp for autocompletion
		if client:supports_method("textDocument/completion") then
			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp_mappings,
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end
	end,
})

-- vim.cmd("set completeopt+=noselect")

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "LspSignWarn",
			[vim.diagnostic.severity.ERROR] = "LspSignError",
			[vim.diagnostic.severity.INFO] = "LspSignInfo",
			[vim.diagnostic.severity.HINT] = "LspSignHint",
		},
	},
	-- float = { border = "rounded", style = "minimal" },
	virtual_text = { current_line = true },
	-- virtual_lines = {
	-- 	-- Only show virtual line diagnostics for the current cursor line
	-- 	current_line = true,
	-- },
})
