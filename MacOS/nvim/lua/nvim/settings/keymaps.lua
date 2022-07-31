local function bind_key(mode, extra_opts)
	extra_opts = extra_opts or { noremap = true, silent = true }

	return function(key, remap, opts)
		opts = vim.tbl_extend("force", extra_opts, opts or {})

		vim.keymap.set(mode, key, remap, opts)
	end
end

local map = bind_key("")
local nnoremap = bind_key("n")
local vnoremap = bind_key("v")

local set_global = vim.api.nvim_set_var

set_global("mapleader", " ")

map("<Space>", "<Nop>")

nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")

nnoremap("<C-Up>", "<cmd>resize -2<CR>")
nnoremap("<C-Down>", "<cmd>resize +2<CR>")
nnoremap("<C-Left>", "<cmd>vertical resize -2<CR>")
nnoremap("<C-Right>", "<cmd>vertical resize +2<CR>")

vnoremap("<", "<gv")
vnoremap(">", ">gv")

nnoremap("<leader>w", "<cmd>w<CR>")
nnoremap("<leader>q", "<cmd>Bdelete<CR>")
nnoremap("<S-l>", "<cmd>BufferLineCycleNext<CR>")
nnoremap("<S-h>", "<cmd>BufferLineCyclePrev<CR>")

nnoremap("<leader>ee", "<cmd>NvimTreeToggle<CR>")

nnoremap("<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>")
nnoremap("<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>")
nnoremap("<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>")
nnoremap("<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>")
nnoremap("<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>")
nnoremap("<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>")
nnoremap("<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>")
nnoremap("<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>")
nnoremap("<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>")
