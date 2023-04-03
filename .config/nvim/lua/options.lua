local opt = vim.opt
local g = vim.g

-- Line numbers
opt.nu = true
opt.relativenumber = true
opt.scrolloff = 10

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Misc
opt.wrap = false -- No wrap
opt.swapfile = false
opt.backup = false

-- Colors
opt.termguicolors = true
vim.cmd.colorscheme "catppuccin"

-- For nvim-tree.lua
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1


-- For statusline (staline)
opt.laststatus=2
opt.showtabline=2
