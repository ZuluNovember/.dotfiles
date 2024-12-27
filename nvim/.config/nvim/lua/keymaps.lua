--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
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
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Navigate quickfix list
vim.keymap.set("n", "gn", ":cn<CR>")
vim.keymap.set("n", "gp", ":cp<CR>")

-- config
vim.keymap.set("n", "\\e", ":tabe $HOME/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "\\r", ":source $HOME/.config/nvim/init.lua<CR>")

-- Insert --
vim.keymap.set("i", "<C-c>", "<ESC>")

-- Visual --
-- paste without changing register content
vim.keymap.set("x", "p", '"_c<Esc>p')

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")

-- Terminal
