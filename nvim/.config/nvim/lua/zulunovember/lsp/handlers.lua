local M = {}

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

local on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    lsp_keymaps(bufnr)
end
local capabilities = vim.lsp.protocol.make_client_capabilities()

local nvim_lsp = require("lspconfig")
local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

nvim_lsp["tsserver"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = require('lspconfig.util').root_pattern('.git'),
})

nvim_lsp["eslint"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = require('lspconfig.util').root_pattern('.git'),
})

nvim_lsp["sumneko_lua"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = require('lspconfig.util').root_pattern('.git'),
})

nvim_lsp["gopls"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "go", "gomod" },
    root_dir = require('lspconfig.util').root_pattern("go.mod", ".git"),
    flags = lsp_flags,
    settings = {
        ["gopls"] = {
            usePlaceholders = false,
            buildFlags = { "-tags=integration" },
            gofumpt = true,
            ["local"] = "<repo>",
        }
    },
    init_options = {
        buildFlags = { "-tags=integration" },
    }
}

return M
