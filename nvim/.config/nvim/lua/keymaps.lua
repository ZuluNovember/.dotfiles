local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate quickfix list
keymap("n", "gn", ":cn<CR>", opts)
keymap("n", "gp", ":cp<CR>", opts)

-- config
keymap("n", "\\e", ":tabe $HOME/.config/nvim/init.lua<CR>", opts)
keymap("n", "\\r", ":source $HOME/.config/nvim/init.lua<CR>", opts)

-- Insert --
keymap("i", "<C-c>", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Terminal
keymap("n", "<leader>ts", ":vsplit +terminal<CR>", opts)
keymap("n", "<leader>tt", ":10split +terminal<CR>", opts)
keymap("n", "<leader>tl", ":lua require('util_funcs').open_float_terminal('lazygit')<CR>", opts)
keymap("t", "<C-q>", "<C-\\><C-n>", opts)
