local bufferline_status_ok, bufferline = pcall(require, "bufferline")
if not bufferline_status_ok then
	return
end

bufferline.setup({
	options = {
		numbers = "none",
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator_icon = "",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 30,
		tab_size = 21,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		diagnostics_indicator = function(count, level)
			local diagnostic_icons = {
				info = " ",
				warning = " ",
				error = " ",
				hint = " ",
			}
			return diagnostic_icons[level] .. count
		end,
		offsets = {
			{ filetype = "NvimTree", text = "", highlight = "Directory", padding = 1 },
		},
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "thin",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
	},
	highlights = {
		fill = {
			guifg = "NONE",
			guibg = "NONE",
		},
		background = {
			guifg = "NONE",
			guibg = "NONE",
		},
		tab = {
			guifg = "NONE",
			guibg = "NONE",
		},
		tab_selected = {
			guifg = "NONE",
			guibg = "NONE",
		},
		tab_close = {
			guifg = "NONE",
			guibg = "NONE",
		},
		close_button = {
			guifg = "NONE",
			guibg = "NONE",
		},
		close_button_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		close_button_selected = {
			guifg = "NONE",
			guibg = "NONE",
		},
		buffer_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		buffer_selected = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
		},
		diagnostic = {
			guifg = "NONE",
			guibg = "NONE",
		},
		diagnostic_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		diagnostic_selected = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
		},
		hint = {
			guifg = "NONE",
			guisp = "NONE",
			guibg = "NONE",
		},
		hint_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		hint_selected = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
			guisp = "NONE",
		},
		hint_diagnostic = {
			guifg = "NONE",
			guisp = "NONE",
			guibg = "NONE",
		},
		hint_diagnostic_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		hint_diagnostic_selected = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
			guisp = "NONE",
		},
		info = {
			guifg = "NONE",
			guisp = "NONE",
			guibg = "NONE",
		},
		info_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		info_selected = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
			guisp = "NONE",
		},
		info_diagnostic = {
			guifg = "NONE",
			guisp = "NONE",
			guibg = "NONE",
		},
		info_diagnostic_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		info_diagnostic_selected = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
			guisp = "NONE",
		},
		warning = {
			guifg = "NONE",
			guisp = "NONE",
			guibg = "NONE",
		},
		warning_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		warning_selected = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
			guisp = "NONE",
		},
		warning_diagnostic = {
			guifg = "NONE",
			guisp = "NONE",
			guibg = "NONE",
		},
		warning_diagnostic_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		warning_diagnostic_selected = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
			guisp = "NONE",
		},
		error = {
			guifg = "NONE",
			guibg = "NONE",
			guisp = "NONE",
		},
		error_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		error_selected = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
			guisp = "NONE",
		},
		error_diagnostic = {
			guifg = "NONE",
			guibg = "NONE",
			guisp = "NONE",
		},
		error_diagnostic_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		error_diagnostic_selected = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
			guisp = "NONE",
		},
		modified = {
			guifg = "NONE",
			guibg = "NONE",
		},
		modified_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		modified_selected = {
			guifg = "NONE",
			guibg = "NONE",
		},
		duplicate_selected = {
			guifg = "NONE",
			gui = "italic",
			guibg = "NONE",
		},
		duplicate_visible = {
			guifg = "NONE",
			gui = "italic",
			guibg = "NONE",
		},
		duplicate = {
			guifg = "NONE",
			gui = "italic",
			guibg = "NONE",
		},
		separator_selected = {
			guifg = "NONE",
			guibg = "NONE",
		},
		separator_visible = {
			guifg = "NONE",
			guibg = "NONE",
		},
		separator = {
			guifg = "NONE",
			guibg = "NONE",
		},
		indicator_selected = {
			guifg = "NONE",
			guibg = "NONE",
		},
		pick_selected = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
		},
		pick_visible = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
		},
		pick = {
			guifg = "NONE",
			guibg = "NONE",
			gui = "bold",
		},
	},
})
