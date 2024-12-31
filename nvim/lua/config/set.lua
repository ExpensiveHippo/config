local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.clipboard:append { "unnamed" }

opt.nu = true
opt.relativenumber = true

opt.wrap = false

opt.hls = false

opt.undodir = os.getenv("HOMEPATH") .. "/.vim/undo"

opt.termguicolors = true
