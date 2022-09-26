local g = vim.g
local o = vim.o

vim.cmd("colorscheme dracula")
o.termguicolors = true

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.relativenumber = true
o.cursorline = true

-- Better editing experience
o.mouse="a"
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 2
o.shiftwidth = 0
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '
