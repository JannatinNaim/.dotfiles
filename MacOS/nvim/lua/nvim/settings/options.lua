local options = vim.opt

options.colorcolumn = "80,120"
options.cursorline = true
options.guicursor = ""
options.guifont = "JetBrains_Mono_Nerd_Font:h17"
options.laststatus = 3
options.number = true
options.relativenumber = true
options.showmode = false
options.showtabline = 2
options.signcolumn = "yes"
options.syntax = "on"
options.termguicolors = true
options.wrap = false
options.fixendofline = true

options.completeopt = { "menu", "menuone", "noinsert", "noselect" }

options.gdefault = true
options.iskeyword:append("-")
options.shortmess:append("csI")
options.whichwrap:append("b,h,l,<,>,[,]")

options.mouse = "a"

options.pumheight = 12

options.scrolloff = 10
options.sidescrolloff = 10

options.expandtab = true
options.shiftwidth = 2
options.softtabstop = 2
options.tabstop = 2

options.ignorecase = true
options.smartcase = true
options.smartindent = true

options.splitbelow = true
options.splitright = true

options.swapfile = false
options.undofile = true
options.writebackup = false

options.updatetime = 100
options.timeout = false
options.browsedir = "buffer"
vim.g.netrw_banner = 0

vim.cmd("highlight ColorColumn guibg=gray50")
