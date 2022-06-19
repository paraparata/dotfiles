local set = vim.opt

set.number = true
set.relativenumber = true
set.smartindent = true
set.smarttab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.incsearch = true
vim.cmd [[set mouse=a]]
vim.cmd [[lcd $PWD]]
vim.cmd [[set smartcase]]
vim.cmd [[set lazyredraw]]
vim.cmd [[set magic]]

-- Coloscheme
vim.g.tokyonight_style = "night"
vim.g.tokyonight_dark_sidebar = true 
vim.g.tokyonight_dark_float= true 
vim.cmd[[colorscheme tokyonight]]
