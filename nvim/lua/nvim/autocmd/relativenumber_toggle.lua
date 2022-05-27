vim.cmd([[
  augroup RELATIVENUMBER_TOGGLE
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
  augroup end
]])
