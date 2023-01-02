local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end

autotag.setup({})

local pairs_status, autopairs = pcall(require, "nvim-autopairs")
if (not pairs_status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})
