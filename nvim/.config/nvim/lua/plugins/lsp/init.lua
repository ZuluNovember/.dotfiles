return {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
    config = function ()
        require("mason").setup()
        require("plugins.lsp.handlers")
    end
}
