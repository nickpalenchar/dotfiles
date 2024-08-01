vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

opt.backspace = '2'
opt.showcmd = true
opt.laststatus = 2
opt.autowrite = true
opt.autoindent = true
opt.cursorline = true
opt.autoread = true
opt.relativenumber = true

-- use spaces for tabs and whatnot
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]
opt.background = "dark"

--Line numbers
vim.wo.number = true

-- Search Settings
opt.ignorecase = true
opt.smartcase = true -- if there's upper casing in search, assume case sensitive

-- backspace
opt.backspace = "indent,eol,start"

-- use system clipboard
opt.clipboard:append('unnamedplus')
