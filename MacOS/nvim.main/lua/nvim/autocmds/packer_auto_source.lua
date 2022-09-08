-- Auto source plugins.

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("PACKER_AUTO_SOURCE", {})

autocmd({ "BufWritePost" }, {
	group = "PACKER_AUTO_SOURCE",
	pattern = "packer.lua",
	command = "source <afile> | PackerSync",
})
