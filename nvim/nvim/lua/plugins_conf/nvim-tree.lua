-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = false,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = { "node_modules"}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = { ".env", ".env.local", ".env.production", ".env.staging" },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    hide_root_folder = false,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}

local map = vim.api.nvim_set_keymap

map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
map('n', '<leader>n', ':NvimTreeFindFile<CR>', {noremap = true, silent =  true})
