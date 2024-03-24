return {
  "uloco/bluloco.nvim",
  lazy = false,
  priority = 1000,
  dependencies = { "rktjmp/lush.nvim" },
  config = function()
	  vim.cmd("colorscheme bluloco")
vim.opt.termguicolors = true
vim.cmd('colorscheme bluloco')
  end,
}
