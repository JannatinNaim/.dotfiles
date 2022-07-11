local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
set_keymap("", "<Space>", "<Nop>", opts)

set_keymap("v", "<leader>y", '"+yi<ESC>', opts)

set_keymap("n", "<C-h>", "<C-w>h", opts)
set_keymap("n", "<C-j>", "<C-w>j", opts)
set_keymap("n", "<C-k>", "<C-w>k", opts)
set_keymap("n", "<C-l>", "<C-w>l", opts)

set_keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
set_keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
set_keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
set_keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

set_keymap("v", "<", "<gv", opts)
set_keymap("v", ">", ">gv", opts)

set_keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
set_keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)
-- set_keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
-- set_keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)
set_keymap("n", "<leader>q", "<cmd>Bdelete<CR>", opts)
-- set_keymap("n", "<leader>q", "<cmd>bdelete<CR>", opts)
set_keymap("n", "<leader>w", "<cmd>w<CR>", opts)

set_keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", opts)
-- set_keymap("n", "<leader>ee", "<cmd>Lex 25<CR>", opts)
