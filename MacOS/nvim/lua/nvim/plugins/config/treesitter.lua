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
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
