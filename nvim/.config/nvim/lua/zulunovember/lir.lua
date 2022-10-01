local status_ok, lir = pcall(require, "lir")

if not status_ok then
    return
end

local actions = require'lir.actions'
local float = require'lir.float'

lir.setup({
    show_hidden_files = true,
    devicons_enable = true,
    hide_cursor = true,
    mappings = {
        ['l']     = actions.edit,
        ['<C-o>'] = actions.tabedit,

        ['-']     = actions.up,
        ['q']     = actions.quit,

        ['N']     = actions.mkdir,
        ['t']     = actions.newfile,
        ['R']     = actions.rename,
        ['Y']     = actions.yank_path,
        ['.']     = actions.toggle_show_hidden,
        ['D']     = actions.delete,
    }
})

local opts = { silent = true, noremap = true }

vim.api.nvim_set_keymap("n", "<Leader>e", ":lua require'lir.float'.toggle()<CR>", opts)
