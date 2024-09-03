local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
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
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	performance = {
		debounce = 100,
	},
	completion = {
		keyword_length = 1,
	},
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gv", function()
		vim.cmd([[vsplit | lua vim.lsp.buf.definition()]])
	end, opts)
	vim.keymap.set("n", "gV", function()
		vim.cmd([[tab split | lua vim.lsp.buf.definition()]])
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", opts)
end)

require("mason-lspconfig").setup({
	handlers = {
		lsp.default_setup,
		solargraph = function()
			require("lspconfig").solargraph.setup({
				settings = {
					solargraph = {
						diagnostics = true,
					},
				},
				init_options = { formatting = true },
			})
		end,
		html = function()
			require("lspconfig").html.setup({
				init_options = {
					provideFormatter = true,
					embeddedLanguages = { css = true, javascript = true },
					configurationSection = { "html", "css", "javascript" },
				},
			})
		end,
		-- clangd = function()
		-- end,
	},
})

require("lspconfig").clangd.setup({
	on_attach = function(client)
		client.server_capabilities.signatureHelpProvider = false
	end,
	filetypes = { "h", "c", "cpp", "cc", "objc", "objcpp" },
	cmd = { "clangd", "--background-index" },
	single_file_support = true,
	root_dir = require("lspconfig").util.root_pattern(
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git"
	),
})

-- ruby LSP
--[[ require("lspconfig").solargraph.setup({
	settings = {
		solargraph = {
			diagnostics = true,
		},
	},
	init_options = { formatting = true },
}) ]]
-- require("lspconfig").rubocop.setup({})
--[[ require("lspconfig").tsserver.setup({
	root_dir = require("lspconfig.util").root_pattern(".git"),
}) ]]

-- graphql LSP
-- require("lspconfig").graphql.setup({})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
