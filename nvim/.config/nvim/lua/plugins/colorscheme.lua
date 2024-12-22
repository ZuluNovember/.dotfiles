return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavor = "mocha",
        },
        config= function ()
            require("catppuccin").setup {
                color_overrides = {
                    mocha = {
                        base="#282c34"
                    }
                }
            }
            vim.cmd.colorscheme("catppuccin")
        end
    }
}
