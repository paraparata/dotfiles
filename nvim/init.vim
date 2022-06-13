source $HOME/.config/nvim/modules/general.vim
source $HOME/.config/nvim/modules/plugins.vim
source $HOME/.config/nvim/modules/color-tokyo_night.vim
source $HOME/.config/nvim/modules/rust-lsp.vim
:lua require('nvim-tree-cfg')

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

