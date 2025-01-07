require("paraparata.base")
require("paraparata.keymaps")

vim.o.winbar = "%{%v:lua.require'paraparata.statusline'.eval()%}"
vim.o.titlestring = '[%{fnamemodify(getcwd(), ":t")}] %{expand("%:t")}  –  nvim'
