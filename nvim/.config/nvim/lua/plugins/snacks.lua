return {
    "folke/snacks.nvim",
    opts = {
        bigfile = {},
        indent = {
            animate = {
                enabled = false
            }
        },
        lazygit = {},
    },
    config = function()
        vim.keymap.set('n', '<leader>tl', Snacks.lazygit.open)
        vim.keymap.set('n', '<leader>tt', Snacks.terminal.toggle)
    end

}
