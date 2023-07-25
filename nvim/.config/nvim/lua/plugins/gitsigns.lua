return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        require("gitsigns").setup {
          signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
          },
        }

        local keymap = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        keymap('n', '<leader>gl', '<cmd>Gitsigns blame_line<CR>', opts)
        keymap('n', '<leader>gH', '<cmd>Gitsigns prev_hunk<CR>', opts)
        keymap('n', '<leader>gh', '<cmd>Gitsigns next_hunk<CR>', opts)
        keymap('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>', opts)
    end
}
