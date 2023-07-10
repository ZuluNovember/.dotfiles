return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim", "glepnir/lspsaga.nvim", "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
            require("plugins.lsp.lspsaga")
            require("plugins.lsp.handlers")
        end,
    },
}
