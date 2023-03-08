local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local nmap = function(keys, func)
    vim.keymap.set('n', keys, func, { noremap = true, silent = true })
end

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
keymap("i", "C-c", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- shortcuts for nvim vscode plugin
if vim.g.vscode then
    -- find
    nmap("<leader>ff", [[<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>]])
    nmap("<leader>fs", [[<Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>]])

    -- nav
    nmap("<leader>en", [[<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>]])
    nmap("<leader>ep", [[<Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>]])

    -- goto
    nmap("gr", [[<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>]])
    nmap("gI", [[<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>]])

    -- terminal
    nmap("<leader>tt", [[<Cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>]])
    nmap("<leader>to", [[<Cmd>call VSCodeNotify('workbench.action.terminal.openNativeConsole')<CR>]])

    -- code
    nmap("K", [[<Cmd>call VSCodeNotify('editor.action.showHover')<CR>]])
    nmap("<leader>la", [[<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>]])
    nmap("<leader>lr", [[<Cmd>call VSCodeNotify('editor.action.rename')<CR>]])
end
