local autocmd = vim.cmd

autocmd([[
  augroup INCSEARCH_HIGHLIGHT
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
  augroup END
]])

autocmd([[
  augroup RELATIVENUMBER_TOGGLE
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
  augroup end
]])

autocmd([[
  augroup NO_COMMENT_CONTINUATION
    autocmd!
    autocmd BufEnter * set fo-=c fo-=r fo-=o
  augroup END
]])

autocmd([[
  augroup PACKER_PLUGINS_SYNC
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
