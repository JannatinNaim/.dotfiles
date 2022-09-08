local treesitter_config_status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not treesitter_config_status_ok then
	return
end

treesitter_config.setup({
	ensure_installed = {
		"html",
		"css",
		"scss",
		"javascript",
		"typescript",
		"json",
		"python",
		"lua",
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			scope_incremental = "grc",
			node_incremental = "grn",
			node_decremental = "grm",
		},
	},
})
