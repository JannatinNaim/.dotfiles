local onedarkpro_status_ok, onedarkpro = pcall(require, "onedarkpro")
if not onedarkpro_status_ok then
	return
end

onedarkpro.setup({
	-- dark_theme = "onedark_vivid",
	dark_theme = "onelight",
	plugins = {
		all = true,
	},
	styles = {
		keywords = "bold",
		functions = "bold",
	},
	options = {
		bold = true,
		underline = true,
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
