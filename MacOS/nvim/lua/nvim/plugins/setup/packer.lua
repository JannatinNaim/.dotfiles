local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})

	vim.cmd("packadd packer.nvim")
end

local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	compile_path = vim.fn.stdpath("data") .. "/packer/packer_compiled.lua",
	autoremove = true,
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("navarasu/onedark.nvim")
	use("olimorris/onedarkpro.nvim")

	use("nvim-lualine/lualine.nvim")
	use("akinsho/bufferline.nvim")

	use("kyazdani42/nvim-tree.lua")

	use("nvim-treesitter/nvim-treesitter")

	use("wakatime/vim-wakatime")
	use("andweeb/presence.nvim")

	use("kyazdani42/nvim-web-devicons")
	use("moll/vim-bbye")
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
