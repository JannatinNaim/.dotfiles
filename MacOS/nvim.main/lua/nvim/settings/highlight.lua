local highlight = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

highlight("ColorColumn", { ctermbg = 7, bg = "Gray" })
