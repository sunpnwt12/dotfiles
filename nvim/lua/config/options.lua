local opt = vim.opt

-- leader map
vim.g.mapleader = ","

opt.termguicolors = true

opt.splitright = true

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number"

opt.expandtab = true
opt.smarttab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true

opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.hidden = true
opt.showmatch = true

-- opt.clipboard = "unnamedplus"
opt.pumheight = 10

-- opt.mouse = "a"

opt.showmode = false

opt.splitbelow = true
opt.splitright = true

opt.swapfile = false
opt.backup = false

opt.scrolloff = 8

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
