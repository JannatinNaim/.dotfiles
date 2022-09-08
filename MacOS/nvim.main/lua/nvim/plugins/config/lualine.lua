local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	colored = true,
	update_in_insert = true,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " },
	cond = hide_in_width,
}

local filename = {
	"filename",
	file_status = true,
	path = 0,
	shorting_target = 40,
	symbols = {
		modified = "[+]",
		readonly = "[-]",
		unnamed = "[NO NAME]",
	},
}

local mode = {
	"mode",
	fmt = function(str)
		return "[" .. str .. "]"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	colored = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")

	local chars = {
		"██",
		"▇▇",
		"▆▆",
		"▅▅",
		"▄▄",
		"▃▃",
		"▂▂",
		"▁▁",
		"__",
	}

	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)

	return chars[index]
end

local spaces = function()
	local width = vim.api.nvim_buf_get_option(0, "shiftwidth")
	local expandtab = vim.api.nvim_buf_get_option(0, "expandtab")

	if expandtab then
		return "spaces: " .. width
	else
		return "tabs: " .. width
	end
end

local onedark = require("lualine.themes.onedark")

lualine.setup({
	globalstatus = true,
	options = {
		icons_enabled = true,
		theme = onedark,
		section_separators = { left = "", right = "" },
		component_separators = { left = "|", right = "|" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diagnostics },
		lualine_c = { filename },
		lualine_x = { diff, "encoding", spaces, filetype },
		lualine_y = { progress },
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {
		"nvim-tree",
		"quickfix",
	},
})
