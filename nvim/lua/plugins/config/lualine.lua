-- Load LuaLIne.
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- Only enable modules when window is larger than 80 columns.
local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics", -- LuaLine diagnostics module.
	sources = { "nvim_diagnostic" }, -- Diagnostics source.
	sections = { "error", "warn" }, -- Shown diagnostics.
	symbols = { error = " ", warn = " " }, -- Symbols.
	colored = false, -- Disable colors for colorscheme colors.
	update_in_insert = true, -- Update in insert mode.
	always_visible = true, -- Always visible.
}

local diff = {
	"diff", -- LuaLine diff module.
	colored = true, -- Disable colors for colorscheme colors.
	symbols = { added = " ", modified = " ", removed = " " }, -- Symbols.
	cond = hide_in_width, -- Only show on large displays.
}

local mode = {
	"mode", -- LuaLine mode module.
	fmt = function(str)
		-- return "-- " .. str .. " --"
		return str
	end, -- Format.
}

local filetype = {
	"filetype", -- LuaLine filetype module.
	icons_enabled = true, -- Enable icons.
	icon = nil, -- Module icon.
}

local branch = {
	"branch", -- LuaLine branch module.
	icons_enabled = true, -- Enable icons.
	icon = "", -- Module icon.
}

local location = {
	"location", -- LuaLine location module.
	padding = 0, -- Module padding.
}

local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	-- local chars = {
	--   "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██"
	-- }
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
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	globalstatus = true,
	options = {
		icons_enabled = true,
		-- theme = "onedark",
		theme = "auto",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diagnostics },
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
			},
		},
		lualine_x = { diff, spaces, "encoding", filetype },
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
	tabline = {},
	extensions = {},
})
