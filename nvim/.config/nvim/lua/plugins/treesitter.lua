return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = function()
            local configs = require("nvim-treesitter.configs")

            ---@diagnostic disable-next-line: missing-fields
            configs.setup({
                ensure_installed = { "go", "javascript", "typescript", "lua" },
                auto_install = true,
                sync_install = true,
                ignore_install = { "" },
                autopairs = {
                    enable = true,
                },
                highlight = {
                    enable = true,
                    disable = { "" },
                    additional_vim_regex_highlighting = true,
                },
                indent = { enable = true, disable = { "yaml" } },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                        include_surrounding_whitespace = true,
                    }
                }
            })
        end,
    },
    {
        "nvim-treesitter/playground",
    },
}
