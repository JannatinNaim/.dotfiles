local onedark_status_ok, onedark = pcall(require, "onedark")
if not onedark_status_ok then
	return
end

onedark.setup({
	style = "darker",
	transparent = true,
	term_colors = true,
	ending_tildes = false,
	cmp_itemkind_reverse = false,
	code_style = {
		comments = "none",
		keywords = "bold",
		functions = "bold",
		strings = "none",
		variables = "none",
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
	diagnostics = {
		darker = true,
		undercurl = true,
		background = true,
	},
})

onedark.load()
