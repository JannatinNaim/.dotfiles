local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- vim.lsp.buf.formatting_sync()
				vim.lsp.buf.formatting()
			end,
		})
	end
end

null_ls.setup({
	debug = false,
	save_after_format = true,
	on_attach = on_attach,
	sources = {
		formatting.trim_newlines,
		formatting.trim_whitespace,

		-- diagnostics.cspell.with({
		-- 	extra_args = { "-c", vim.fn.expand("~/.config/nvim/lua/plugins/settings/lsp/settings/cspell.json") },
		-- 	disabled_filetypes = { "NvimTree" },
		-- }),

		-- formatting.prettier.with({
		-- 	prefer_local = true,
		-- extra_args = {
		-- 	"--print-width",
		-- 	120,
		-- },
		-- }),

		-- formatting.eslint.with({
		-- 	prefer_local = true,
		-- }),
		-- diagnostics.eslint.with({
		-- 	prefer_local = true,
		-- }),
		-- code_actions.eslint.with({
		-- 	prefer_local = true,
		-- }),

		-- code_actions.gitsigns,
		-- code_actions.refactoring,
	},
})
