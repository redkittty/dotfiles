local config = function()
  local theme = require("lualine.themes.gruvbox")
  theme.normal.c.bg = nil

  require('lualine').setup {
    options = {
      theme = gruvbox,
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          'mode',
          'buffers',
        },
      },
    },
  }
end
return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
}
