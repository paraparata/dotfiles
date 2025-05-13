lua << EOF
require('paraparata')
EOF

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" colorscheme
Plug 'folke/tokyonight.nvim'
" Plug 'paraparata/poimandres.nvim'

" nvim treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'nvim-tree/nvim-web-devicons'

" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim',          " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional
Plug 'ziglang/zig.vim'       					 	 " https://github.com/ziglang/zig.vim

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required


Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

Plug 'tpope/vim-fugitive'

Plug 'windwp/nvim-autopairs'

Plug 'windwp/nvim-ts-autotag'

Plug 'goolord/alpha-nvim'

Plug 'nvim-lualine/lualine.nvim'

Plug 'mhartington/formatter.nvim'

Plug 'numToStr/Comment.nvim'

Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'sindrets/diffview.nvim'

Plug 'mfussenegger/nvim-lint'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'lewis6991/gitsigns.nvim'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'nvim-tree/nvim-tree.lua'

Plug 'dhruvasagar/vim-table-mode'

" Plug 'sphamba/smear-cursor.nvim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
