return {
    {
        "tamago324/lir.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
        config = function ()
            local lir = require("lir")
            local actions = require("lir.actions")
            local float = require("lir.float")
            
            lir.setup({
                show_hidden_files = true,
                devicons = {
                    enable = true,
                },
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

            vim.api.nvim_set_keymap("n", "<Leader>x", ":lua require'lir.float'.toggle()<CR>", opts)
    end
    },
}
