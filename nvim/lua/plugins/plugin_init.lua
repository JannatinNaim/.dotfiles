local fn = vim.fn

-- Auto install Packer.
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.cmd [[packadd packer.nvim]]
end

-- Auto install Packer plugins.
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin_list.lua source <afile> | PackerSync
  augroup end
]]
