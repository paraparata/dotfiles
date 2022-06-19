-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "css", "markdown", "javascript", "typescript", "json", "lua", "rust", "tsx", "vim", "yaml", "toml", "bash", "python" },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  playground = {
    enable = true
  },
  context_commentstring = {
    enable = true
  }
}
