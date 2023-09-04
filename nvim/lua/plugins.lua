local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- color scheme
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  -- code completion
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'L3MON4D3/LuaSnip'

  -- highlighter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  -- use { "nvim-telescope/telescope-file-browser.nvim", branch = 'feat/tree' } -- file browser using telescope
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- pairing
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use "lukas-reineke/indent-blankline.nvim"
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- formatter
  use('MunifTanjim/prettier.nvim')

  -- ccomment
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

  -- highlight color
  use 'norcalli/nvim-colorizer.lua'

  -- git diff
  use { 'sindrets/diffview.nvim', requires = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } }
end)
