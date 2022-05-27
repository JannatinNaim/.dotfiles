vim.opt.colorcolumn = "80,100,120"
vim.opt.cursorline = true
vim.opt.guicursor = ""
vim.opt.guifont = "JetBrains_Mono_Nerd_Font:h15"
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.syntax = "on"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.fixendofline = true

vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }

vim.opt.gdefault = true
vim.opt.iskeyword:append("-")
vim.opt.shortmess:append("csI")
vim.opt.whichwrap:append("b,h,l,<,>,[,]")

vim.opt.mouse = "a"

vim.opt.pumheight = 12

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.swapfile = false
vim.opt.undodir = "$HOME/.local/share/nvim/undo"
vim.opt.undofile = true
vim.opt.writebackup = false

vim.opt.updatetime = 100
vim.opt.timeout = false
vim.g.netrw_banner = 0
vim.opt.browsedir = "buffer"

vim.cmd("highlight ColorColumn guibg=gray50")
