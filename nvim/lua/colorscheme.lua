-- tokyonight
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors)
    colors.comment = "#59628b"
  end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  --@param colors ColorScheme
  on_highlights = function(highlights)
    highlights.CursorLineNr = {
      fg = "#9ece6a"
    }
    highlights.LineNr = {
      fg = "#565f89",
      bg = "#000000"
    }

  end,
})

-- catppuccin
require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  --  no_italic = false, -- Force no italic
  --  no_bold = false, -- Force no bold
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    --    loops = {},
    --    functions = {},
    --    keywords = {},
    --    strings = {},
    --    variables = {},
    --    numbers = {},
    --    booleans = {},
    --    properties = {},
    --    types = {},
    --    operators = {},
  },
  color_overrides = {},
  custom_highlights = function(colors)
    return {
      CursorLineNr = { fg = colors.green },
      LineNr = { bg = '#1e1e2e', fg = '#9b8c6a' },
      IndentBlanklineChar = { fg = colors.surface0 },
      IndentBlanklineContextChar = { fg = colors.peach },
      IndentBlanklineContextStart = { sp = colors.peach, style = { "underline" } },
    }
  end,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    notify = false,
    mini = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

vim.cmd [[colorscheme catppuccin]]
