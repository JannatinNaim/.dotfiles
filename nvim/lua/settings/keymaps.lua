local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Space as leader key.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File explorer.
keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", opts)

-- Copy or Paste to and from global clipboard.
keymap("v", "<leader>y", '"+yi<ESC>', opts)
keymap("n", "<leader>p", '"+p', opts)
keymap("v", "leader>p", 'c<ESC>"+p', opts)

-- Window navigation.
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window resize.
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Navigate buffers.
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<Tab>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", opts)
keymap("n", "<leader>q", "<cmd>Bdelete<CR>", opts)

-- Move lines up and down.
keymap("n", "<A-j>", "<Esc><cmd>m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc><cmd>m .-2<CR>==", opts)
keymap("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)

-- Preserve highlight on indent.
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected text up and down.
keymap("v", "<A-j>", "<cmd>m .+1<CR>==", opts)
keymap("v", "<A-k>", "<cmd>m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Move selected lines up and down.
keymap("x", "<A-j>", "<cmd>move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", "<cmd>move '<-2<CR>gv-gv", opts)

-- Reset J & K default behavior.
keymap("n", "J", "j", opts)
keymap("n", "K", "k", opts)
keymap("x", "J", "j", opts)
keymap("x", "K", "k", opts)

-- Telescope.
keymap("n", "<leader>ft", "<cmd>lua require('telescope.builtin').treesitter()<CR>", opts)
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", "<leader>fl", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<CR>", opts)
keymap("n", "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<CR>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').git_status()<CR>", opts)

keymap("n", "<leader>w", "<cmd>w<CR>", opts)
keymap("n", "<leader>fd", "<cmd>Format<CR>", opts)

keymap("n", "<leader>sd", "<cmd>Cheat<CR>", opts)
