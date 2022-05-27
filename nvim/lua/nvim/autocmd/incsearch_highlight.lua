vim.cmd([[
  augroup INCSEARCH_HIGHLIGHT
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
  augroup END
]])
