-- Highlight matches during search.

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("INCSEARCH_HIGHLIGHT", {})

autocmd({ "CmdlineEnter" }, {
	pattern = "/,\\?",
	command = "set hlsearch",
})

autocmd({ "CmdlineLeave" }, {
	pattern = "/,\\?",
	command = "set nohlsearch",
})
