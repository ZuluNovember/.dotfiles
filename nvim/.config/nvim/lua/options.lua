local options = {
    backup = false,            -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 0,             -- more space in the neovim command line for displaying messages
    completeopt = { "menu,menuone,noinsert" },  -- mostly just for cmp
    conceallevel = 0,          -- so that `` is visible in markdown files
    fileencoding = "utf-8",    -- the encoding written to a file
    hlsearch = true,           -- highlight all matches on previous search pattern
    ignorecase = true,         -- ignore case in search patterns
    mouse = "a",               -- allow the mouse to be used in neovim
    pumheight = 10,            -- pop up menu height
    showmode = false,          -- we don't need to see things like -- INSERT -- anymore
    showtabline = 1,           -- always show tabs
    laststatus = 2,
    smartcase = true,          -- smart case
    smartindent = true,        -- make indenting smarter again
    splitbelow = true,         -- force all horizontal splits to go below current window
    splitright = true,         -- force all vertical splits to go to the right of current window
    swapfile = false,          -- creates a swapfile
    termguicolors = true,      -- set term gui colors (most terminals support this)
    undofile = true,           -- enable persistent undo
    updatetime = 300,          -- faster completion (4000ms default)
    writebackup = false,       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,          -- convert tabs to spaces
    shiftwidth = 4,            -- the number of spaces inserted for each indentation
    tabstop = 4,               -- insert 2 spaces for a tab
    cursorline = true,         -- highlight the current line
    number = true,             -- set numbered lines
    relativenumber = true,     -- set relative numbered lines
    numberwidth = 8,           -- set number column width to 2 {default 4}
    signcolumn = "yes",        -- always show the sign column, otherwise it would shift the text each time
    wrap = false,              -- display lines as one long line
    scrolloff = 8,             -- is one of my fav
    sidescrolloff = 8,
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    cc = "120"
}

vim.opt.shortmess:append "c"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd [[set iskeyword+=-]]
