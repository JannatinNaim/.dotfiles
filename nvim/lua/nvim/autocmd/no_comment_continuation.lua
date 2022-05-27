vim.cmd([[
  augroup NO_COMMENT_CONTINUATION
    autocmd!
    autocmd BufEnter * set fo-=c fo-=r fo-=o
  augroup END
]])
