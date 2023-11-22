return {
    {
        "ZuluNovember/chic.nvim",
    },
    {
        "sainnhe/everforest",
        config = function()
            vim.g.everforest_background = "hard"
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavor = "mocha",
            transparent_background = true
        }
    }
}
