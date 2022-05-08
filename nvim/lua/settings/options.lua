local options = {
  exrc = true, -- Project based configuration.
  guicursor = "", -- Always use block cursor.
  backup = false, -- Use backup file.
  writebackup = false, -- Prevent file from being edited by other programs.
  hidden = true, -- Have buffers open in background.
  errorbells = false, -- No error bells.
  cmdheight = 1, -- Command prompt height.
  completeopt = { "menuone", "noselect" }, -- Completion popup menu with no defaults.
  conceallevel = 0, -- Show all characters normally.
  fileencoding = "utf-8", -- Set file encoding.
  incsearch = true, -- Hilight search matches on type.
  hlsearch = true, -- Highlight all search matches.
  ignorecase = true, -- Ignore cases during search.
  smartcase = true, -- Overwrite ignorecase if search contains uppercase letters.
  mouse = "a", -- Enable mouse.
  pumheight = 8, -- Popup menu height.
  showtabline = 2, -- Display tab bar.
  showmode = false, -- Display current mode.
  smartindent = true, -- Smart indentation.
  splitbelow = true, -- Horizontal splits go below.
  splitright = true, -- Vertical splits go to the right.
  swapfile = false, -- Use swap files.
  termguicolors = true, -- Use terminal GUI colors.
  timeoutlen = 500, -- Action timeout.
  undofile = true, -- Use undo file.
  updatetime = 100, -- Editor update time.
  expandtab = true, -- Use spaces for tabs.
  shiftwidth = 2, -- Indentation spaces.
  tabstop = 2, -- Indentation tab spaces.
  cursorline = true, -- Highlight cursor line.
  number = true, -- Show line numbers.
  relativenumber = true, -- Use relative line numbers.
  numberwidth = 4, -- Line number column width.
  signcolumn = "yes", -- Display sign column.
  colorcolumn = "80,120", -- Ruler.
  wrap = false, -- Wrap text.
  scrolloff = 8, -- Scroll off height.
  sidescrolloff = 8, -- Scroll off width.
  guifont = "'JetBrainsMono Nerd Font':h15", -- Font in graphical applications.
  laststatus = 3, -- Display only one status line.
}

vim.opt.shortmess:append "c" -- Disable hit-enter prompts.

for k, v in pairs(options) do
  vim.opt[k] = v
end -- Set options.

vim.cmd "let g:netrw_banner = 0"
vim.cmd "set whichwrap+=<,>,[,],h,l" -- Move cursor to next line.
vim.cmd [[set iskeyword+=-]] -- Characters to be considered as part of words.
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]] -- Disable comment continuation.
vim.cmd "highlight ColorColumn ctermbg=238 guibg=gray50" -- Set color column color.

vim.cmd [[
  augroup vim_insert_relative_number_toggle
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
  augroup end
]] -- No relative numbers on insert mode.
