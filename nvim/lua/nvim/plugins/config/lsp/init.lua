local lsp_installer_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not lsp_installer_status_ok then
	return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local servers = {
	"bashls",
	"cssls",
	"emmet_ls",
	"html",
	"jsonls",
	"sumneko_lua",
	"tsserver",
	"pyright",
	"vimls",
}

lsp_installer.setup({
	automatic_installation = true,
	ensure_installed = servers,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
	capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

local lsp_keymaps = function(bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-i>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fl", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local function lsp_highlight_document(client)
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
			false
		)
	end
end

local function disable_lsp_formatting(client)
	for _, server in pairs(servers) do
		if client.name == server then
			client.resolved_capabilities.document_formatting = false
		end
	end
end

local function show_diagnostics_on_hover(bufnr)
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
end

for _, server in pairs(servers) do
	local server_opts = {
		on_attach = function(client, bufnr)
			lsp_keymaps(bufnr)
			lsp_highlight_document(client)
			disable_lsp_formatting(client)
			-- show_diagnostics_on_hover(bufnr)
		end,
		capabilities = capabilities,
	}

	local has_custom_server_opts, custom_server_opts = pcall(require, "nvim.plugins.config.lsp.settings." .. server)
	if has_custom_server_opts then
		server_opts = vim.tbl_deep_extend("force", custom_server_opts, server_opts)
	end

	lspconfig[server].setup(server_opts)
end

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

require("nvim.plugins.config.lsp.settings.null_ls")
