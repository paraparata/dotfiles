local keymap = vim.keymap

-- <leader> using <Space>
vim.g.mapleader = " "

-- vim :so set source
-- vim.keymap.set("n", "<leader>so", vim.cmd.so)

-- Open NetRW
keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("n", "<leader>pV", vim.cmd.Lexplore)

-- Change escape function
keymap.set("i", "jj", "<esc>", {})
keymap.set("c", "jj", "<c-c>", {})

-- True paste (get only from y)
keymap.set("n", "<leader>pp", '"0p')

-- prevent c(hange) to copy
keymap.set("n", "c", '"0c')

-- True delete
keymap.set("n", "<leader>d", '"_d')
keymap.set("x", "<leader>d", '"_d')
keymap.set("n", "<leader>x", '"_x')
keymap.set("x", "<leader>x", '"_x')

-- move line
keymap.set("n", "∆", ":m .+1<CR>==")
keymap.set("n", "˚", ":m .-2<CR>==")
keymap.set("v", "∆", ":m '>+1<CR>gv=gv")
keymap.set("v", "˚", ":m '<-2<CR>gv=gv")

-- Replace same word with confirmation
-- First select the word or text then
-- With this we can use the leader key + j to replace the word under the cursor.
-- We can navigate to other matches with n or N,
-- then use the . key when we want to replace the text.
keymap.set("n", "<leader>j", "*``cgn")

-- Replace from surround. Anything from what surround kirby (\(.*\)) will be replaced.
-- Use \1 as reference to kirby.
keymap.set("c", "<C-\\>", "\\(.*\\)")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Virtual block
keymap.set("n", "<leader>v", "<C-v>")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "tc", ":tabclose")
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Move window
keymap.set("n", "<leader><tab>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Move between buffers
keymap.set("n", "<leader>bn", ":bn<Return>")
keymap.set("n", "<leader>bp", ":bp<Return>")
keymap.set("n", "<leader>bd", ":bd<Return>")

-- Delete all buffers except the current opened one
keymap.set("n", "<leader>bx", ':%bdelete|edit #|normal `"<CR>')
