local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local cmp_buffer_status_ok, cmp_buffer = pcall(require, "cmp")
if not cmp_buffer_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
} -- Kind Icons.

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	}, -- Snippet engine.
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(), -- Scroll up completion list.
		["<C-j>"] = cmp.mapping.select_next_item(), -- Scroll down completion list.
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }), -- Scroll up documentation.
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }), -- Scroll down documentation.
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- Pull up completion.
		["<C-y>"] = cmp.config.disable, -- Disable shortcut.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}), -- Exit completion.
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Use selection.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
			"c",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
			"c",
		}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" }, -- Suggestion fields.
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[SHIPPET]",
				cmdline = "[CMDLINE]",
				path = "[PATH]",
				fuzzy_buffer = "[BUFFER]",
				emoji = "[EMOJI]",
			})[entry.source.name]
			return vim_item
		end,
	}, -- Suggestion formats.
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{
			name = "path",
			options = {
				trailing_slash = true,
			},
		},
		{
			name = "buffer",
			sorting = {
				comparators = {
					function(...)
						return cmp_buffer:compare_locality(...)
					end,
				},
			},
			get_bufnrs = function()
				local buf = vim.api.nvim_get_current_buf()
				local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
				if byte_size > 1024 * 1024 then
					return {}
				end
				return { buf }
			end,
		},
		{ name = "emoji", options = { insert = true } },
	}, -- Suggestion sources.
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = cmp.config.window.bordered(),
	}, -- Documentation window.
	experimental = {
		ghost_text = false,
		native_menu = false,
	}, -- Experimental features.
})

cmp.setup.cmdline(":", {
	sources = {
		{ name = "cmdline" },
		{ name = "path" },
	},
})

cmp.setup.cmdline("/", {
	sources = cmp.config.sources({
		{
			name = "fuzzy_buffer",
			options = {
				get_bufnrs = function()
					local bufs = {}
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
						if buftype ~= "nofile" and buftype ~= "prompt" then
							bufs[#bufs + 1] = buf
						end
					end
					return bufs
				end,
			},
		},
		{ name = "nvim_lsp_document_symbol" },
		{ name = "nvim_lsp_signature_help" },
	}),
})
