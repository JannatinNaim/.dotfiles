local status_ok, onedarkpro = pcall(require, "onedarkpro")
if not status_ok then
	return
end

onedarkpro.setup({
	dark_theme = "onedark_vivid",
	plugins = {
		all = true,
	},
	styles = {
		comments = "italic",
		keywords = "bold",
		functions = "bold,italic",
		variables = "bold",
	},
	options = {
		bold = true,
		italic = true,
		underline = true,
		undercurl = true,
		cursorline = true,
		transparency = true,
		terminal_colors = true,
	},
	colors = {
		fg = "#a0a8b7",
		red = "#e55561",
		orange = "#cc9057",
		yellow = "#e2b86b",
		green = "#8ebd6b",
		cyan = "#48b0bd",
		blue = "#4fa6ed",
		purple = "#bf68d9",
		black = "#0e1013",
		gray = "#535965",
	},
	hlgroups = {
		CursorLineNr = { fg = "NONE", bg = "NONE" },
	},
})

onedarkpro.load()
