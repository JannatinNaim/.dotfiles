local opt = vim.opt

-- Appearance
opt.termguicolors = true
opt.syntax = "on"
opt.number = true
opt.guicursor = ""
opt.cursorline = true
opt.cursorlineopt = "number,screenline"
opt.colorcolumn = "80,120"
opt.showmode = false
opt.showtabline = 2
opt.laststatus = 3
opt.pumheight = 12
opt.list = true
opt.listchars = "tab:> ,trail:-,nbsp:+"
opt.wrap = false
opt.foldcolumn = "auto"
opt.signcolumn = "yes"
opt.guioptions = "egmrLTadi"
opt.guifont = "JetBrainsMono_Nerd_Font:h16"

-- Productivity Boost
opt.mouse = "ar"
opt.confirm = true
opt.updatetime = 100
opt.undofile = true
opt.swapfile = false
opt.writebackup = false
opt.browsedir = "buffer"
opt.shellslash = true
opt.completeopt = { "menuone", "preview", "noinsert", "noselect" }

-- Code Styles
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.formatoptions = "tqn2bjp"
opt.smartcase = true
opt.ignorecase = true
opt.smartindent = true
opt.iskeyword:append("-")
opt.matchpairs:append("<:>")
opt.shortmess:append("csI")

-- Ease Of Use
opt.timeout = false
opt.scrolloff = 8
opt.sidescrolloff = 12
opt.splitbelow = true
opt.splitright = true
opt.whichwrap:append("b,h,l,<,>,[,]")
