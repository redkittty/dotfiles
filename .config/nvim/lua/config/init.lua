local keybind = vim.keymap.set
local opt = vim.opt
-- Lazy.nvim Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup('plugins')

-- Options
-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = false
opt.colorcolumn = '188'
opt.completeopt = "menuone,noselect"
opt.showmode = false

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false

-- Keymappings
-- Ctrl + Backspace for deleting previous word
keybind("i", "<C-BS>", "<C-W>")

-- Saving in Edit Mode
keybind("i", "<C-w>", "<cmd>w<CR>")

-- Nvim Tree Toggle
keybind("n", "<space>e", "<cmd>NvimTreeToggle<CR>")
keybind("n", "<S-e>", "<cmd>NvimTreeFocus<CR>")
