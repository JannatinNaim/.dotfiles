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

	vim.cmd([[packadd packer.nvim]])
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
	use("nvim-lua/plenary.nvim")
	use("olimorris/onedarkpro.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use("lewis6991/gitsigns.nvim")
	use("ThePrimeagen/refactoring.nvim")
	use("onsails/lspkind.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-omni")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-document-symbol")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	-- use("hrsh7th/cmp-copilot")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("saadparwaiz1/cmp_luasnip")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "tzachar/cmp-fuzzy-buffer", requires = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } })
	use({ "tzachar/cmp-fuzzy-path", requires = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } })
	use("andersevenrud/cmp-tmux")
	use("tamago324/cmp-zsh")
	-- use("github/copilot.vim")
	use("nvim-lualine/lualine.nvim")
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use("moll/vim-bbye")
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	use("lukas-reineke/indent-blankline.nvim")
	use("wakatime/vim-wakatime")
	use("andweeb/presence.nvim")
	use("b0o/SchemaStore.nvim")
	use("ful1e5/onedark.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
