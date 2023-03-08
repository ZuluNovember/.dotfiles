return {
    {
        "tamago324/lir.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
        config = function()
            local lir = require("lir")
            local actions = require("lir.actions")
            local mark_actions = require("lir.mark.actions")
            local clipboard_actions = require("lir.clipboard.actions")
            local float = require("lir.float")

            lir.setup({
                show_hidden_files = true,
                devicons = {
                    enable = true,
                },
                hide_cursor = true,
                mappings = {
                    ["l"] = actions.edit,
                    ["L"] = actions.vsplit,

                    ["h"] = actions.up,
                    ["q"] = actions.quit,

                    ["N"] = actions.mkdir,
                    ["t"] = actions.newfile,
                    ["R"] = actions.rename,
                    ["Y"] = actions.yank_path,
                    ["."] = actions.toggle_show_hidden,
                    ["D"] = actions.delete,

                    ["J"] = function()
                        mark_actions.toggle_mark()
                        vim.cmd("normal! j")
                    end,
                    ["y"] = clipboard_actions.copy,
                    ["x"] = clipboard_actions.cut,
                    ["p"] = clipboard_actions.paste,
                },
            })

            local opts = { silent = true, noremap = true }

            vim.api.nvim_set_keymap("n", "<Leader>x", ":lua require'lir.float'.toggle()<CR>", opts)
        end,
    },
}
