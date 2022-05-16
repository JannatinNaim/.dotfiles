local status_ok, onedarkpro = pcall(require, "onedarkpro")
if not status_ok then
	return
end

onedarkpro.setup({
  dark_theme = "onedark_vivid",
	options = {
		bold = true,
		italic = true,
		-- underline = true,
		-- undercurl = true,
		cursorline = true,
		transparency = true,
		terminal_colors = true,
		-- window_unfocussed_color = true,
	},
	plugins = {
		all = true,
	},
})

onedarkpro.load()
