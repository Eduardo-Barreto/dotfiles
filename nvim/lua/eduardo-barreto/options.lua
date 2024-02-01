vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.conceallevel = 0

vim.opt.ignorecase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.loaded_netrw = 1
vim.g.netrwPlugin = 1

-- Add :W command equals :w
vim.cmd("command! W :w")

-- Add :Q command equals :q
vim.cmd("command! Q :q")

