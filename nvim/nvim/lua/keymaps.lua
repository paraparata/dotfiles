local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- init.lua management
keymap("n", "<leader>v", ":e $MYVIMRC<cr>", {})
keymap("n", "<leader>V", ":source $MYVIMRC<cr>", {})
keymap("n", "<leader>pi", ":source $MYVIMRC<cr>:PackerSync<cr>", {})

keymap("i", "jj", "<esc>", {})
keymap("c", "jj", "<c-c>", {})

-- Splits and Tabs Navigation
keymap("n", "<C-j>", "<C-w>j", {})
keymap("n", "<C-k>", "<C-w>k", {})
keymap("n", "<C-h>", "<C-w>h", {})
keymap("n", "<C-l>", "<C-w>l", {})
keymap("n", "<C-,>", "<C-w>n", {})
keymap("n", "<C-.>", "<C-w>p", {})

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", {})

-- Move lines up/down (visual mode)
keymap("v", "J", ":m '>+1<cr>gv=gv", {})
keymap("v", "K", ":m '<-2<cr>gv=gv", {})

-- Telescope
vim.cmd([[
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files({ hidden=true })<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <space> <cmd>lua require('telescope.builtin').buffers()<cr>
]])
