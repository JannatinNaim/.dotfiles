local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have Packer use a popup window.
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Packer.

	use("wakatime/vim-wakatime") -- Wakatime.
	-- use("andweeb/presence.nvim") -- Discord presence.

	-- use("navarasu/onedark.nvim") -- OneDark.
	use("olimorris/onedarkpro.nvim") -- OneDark Pro.
	-- use("Mofiqul/vscode.nvim") -- VsCode Theme.
	use("ChristianChiarulli/nvcode-color-schemes.vim") -- nvCode Colorschemes.
	use("nvim-lualine/lualine.nvim") -- Lualine.
	use("akinsho/bufferline.nvim") -- Bufferline.
	use("kyazdani42/nvim-web-devicons") -- Dev Icons.
	use("kyazdani42/nvim-tree.lua") -- Nvim Tree.

	use("neovim/nvim-lspconfig") -- Nvim LSP.
	use("williamboman/nvim-lsp-installer") -- LSP Installer.

	use("hrsh7th/nvim-cmp") -- Nvim CMP.
	use("hrsh7th/cmp-nvim-lsp") -- Nvim LSP CMP.
	use("hrsh7th/cmp-nvim-lsp-document-symbol") -- Nvim LSP CMP Document Symbol.
	use("hrsh7th/cmp-nvim-lsp-signature-help") -- Nvim LSP CMP Signature Help.
	use("saadparwaiz1/cmp_luasnip") -- Nvim CMP LuaSnip.
	use("hrsh7th/cmp-cmdline") -- Nvim CMP CMDline.
	use("hrsh7th/cmp-path") -- Nvim CMP Path.
	use("hrsh7th/cmp-buffer") -- Nvim CMP Buffer.
	use("hrsh7th/cmp-emoji") -- Nvim CMP Emoji.
	use("b0o/SchemaStore.nvim") -- JSON schemas.

	use("tzachar/fuzzy.nvim") -- Fuzzy.
	use("tzachar/cmp-fuzzy-buffer") -- Nvim CMP fuzzy buffer.

	use("L3MON4D3/LuaSnip") -- LuaSnip.
	use("rafamadriz/friendly-snippets") -- FriendlySnippets.

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
		},
	}) -- Telescope.
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	}) -- Telescope FZF.

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("windwp/nvim-autopairs") -- Auto pairs.
	use("windwp/nvim-ts-autotag") -- Auto tags.

	use("numToStr/Comment.nvim") -- Comment.
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Context aware comment string.

	use("lewis6991/gitsigns.nvim") -- GitSigns.

	use("lukas-reineke/indent-blankline.nvim") -- Indent lines.
	use("moll/vim-bbye") -- Better buffer closing.

	use("jose-elias-alvarez/null-ls.nvim") -- Null ls.

	use("ThePrimeagen/refactoring.nvim") -- Refactoring.

	use("RishabhRD/popfix")
	use("RishabhRD/nvim-cheat.sh")

  use("p00f/nvim-ts-rainbow") -- Rainbow Parentheses.

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
