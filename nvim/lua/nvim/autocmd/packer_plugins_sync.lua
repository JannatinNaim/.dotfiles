vim.cmd([[
  augroup PACKER_PLUGINS_SYNC
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
