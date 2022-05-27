local status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter_config.setup({
	ensure_installed = {
		"bash",
		"css",
		"html",
		"javascript",
		"json",
		"json5",
		"jsonc",
		"lua",
		"python",
		"scss",
		"typescript",
		"vim",
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
