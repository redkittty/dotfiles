return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
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
}
