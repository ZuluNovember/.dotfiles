return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim", "glepnir/lspsaga.nvim", "williamboman/mason-lspconfig.nvim" },
        config = function()
            vim.diagnostic.config({
                virtual_lines = {
                    severity = {
                        min = vim.diagnostic.severity.ERROR,
                    },
                },
            })
            require("mason").setup()
            require("mason-lspconfig").setup()
            require("plugins.lsp.lspsaga")
            require("plugins.lsp.handlers")
        end,
    },
}
