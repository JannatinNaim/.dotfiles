local set = vim.api.nvim_set_option_value
local opts = { scope = "local" }

set("shiftwidth", 4, opts)
set("tabstop", 4, opts)
set("softtabstop", 4, opts)
set("expandtab", false, opts)
