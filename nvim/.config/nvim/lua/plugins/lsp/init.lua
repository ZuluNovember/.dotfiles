return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim", "glepnir/lspsaga.nvim" },
        config = function()
            require("mason").setup()
            require("plugins.lsp.lspsaga")
            require("plugins.lsp.handlers")
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local nls = require("null-ls")
            nls.setup({
                debounce = 150,
                save_after_format = false,
                sources = {
                    nls.builtins.formatting.prettierd,
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.eslint,
                    nls.builtins.diagnostics.eslint,
                    nls.builtins.code_actions.eslint,
                    nls.builtins.diagnostics.shellcheck,
                },
                root_dir = require("null-ls.utils").root_pattern(".git"),
            })
        end,
    },
}