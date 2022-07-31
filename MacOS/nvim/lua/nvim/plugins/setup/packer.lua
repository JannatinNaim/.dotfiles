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
	use("L3MON4D3/LuaSnip")
	use("numToStr/Comment.nvim")

	use("jose-elias-alvarez/null-ls.nvim")

	use("nvim-telescope/telescope.nvim")

	use("wakatime/vim-wakatime")
	use("andweeb/presence.nvim")

	use("moll/vim-bbye")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	use("lukas-reineke/indent-blankline.nvim")

	use("williamboman/nvim-lsp-installer")
	use("hrsh7th/nvim-cmp")

	use("kyazdani42/nvim-web-devicons")
	use("onsails/lspkind.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-github.nvim")
	use("nvim-telescope/telescope-node-modules.nvim")
	use("cljoly/telescope-repo.nvim")
	use("gbrlsnchs/telescope-lsp-handlers.nvim")
	use("xiyaowong/telescope-emoji.nvim")
	use("AckslD/nvim-neoclip.lua")
	use({ "kkharji/sqlite.lua", module = "sqlite" })
	use("sudormrfbin/cheatsheet.nvim")
	use("jvgrootveld/telescope-zoxide")
	use("benfowler/telescope-luasnip.nvim")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-omni")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-document-symbol")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use({ "tzachar/cmp-fuzzy-buffer", requires = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } })
	use({ "tzachar/cmp-fuzzy-path", requires = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } })
	use("tamago324/cmp-zsh")
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
