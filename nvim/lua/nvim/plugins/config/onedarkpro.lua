local onedarkpro_status_ok, onedarkpro = pcall(require, "onedarkpro")
if not onedarkpro_status_ok then
	return
end

onedarkpro.setup({
	dark_theme = "onedark_vivid",
	-- dark_theme = "onelight",
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
		bg = "#282c34",
		fg = "#abb2bf",
		red = "#e05561",
		orange = "#f0a45d",
		yellow = "#d18f52",
		green = "#8cc265",
		cyan = "#42b3c2",
		blue = "#4aa5f0",
		purple = "#c162de",
		white = "#e6e6e6",
		black = "#3f4451",
		gray = "#4f5666",
		highlight = "#abb2bf30",

		-- fg = "#a0a8b7",
		-- red = "#e55561",
		-- orange = "#cc9057",
		-- yellow = "#e2b86b",
		-- green = "#8ebd6b",
		-- cyan = "#48b0bd",
		-- blue = "#4fa6ed",
		-- purple = "#bf68d9",
		-- black = "#0e1013",
		-- gray = "#535965",
	},
	hlgroups = {
		CursorLineNr = { fg = "NONE", bg = "NONE" },
	},
})

onedarkpro.load()
