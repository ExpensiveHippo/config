local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

opt.clipboard:append { "unnamedplus" }

opt.nu = true
opt.relativenumber = true

opt.incsearch = true
opt.hls = false
opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("$HOME/.vim/undo")


opt.termguicolors = true
opt.cursorline = true

opt.scrolloff = 8

opt.splitright = true
opt.splitbelow = true
