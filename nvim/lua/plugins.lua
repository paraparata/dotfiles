return require("packer").startup(function()
  use "folke/tokyonight.nvim"
  use 'tpope/vim-surround'
  use 'wbthomason/packer.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'sbdchd/neoformat'

   -- Autocomplete
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
end)
