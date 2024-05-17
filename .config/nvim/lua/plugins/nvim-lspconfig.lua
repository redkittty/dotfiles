return {
  "neovim/nvim-lspconfig",
  dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
  },
  config = function ()
    require"lspconfig".rust_analyzer.setup{}
    require"lspconfig".pyright.setup{}
  end,
}
