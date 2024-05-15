return {
  "neovim/nvim-lspconfig",
  config = function ()
    require"lspconfig".rust_analyzer.setup{}
    require"lspconfig".lua_language_server.setup{}
  end,
}
