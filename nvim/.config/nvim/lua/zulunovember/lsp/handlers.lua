local M = {}

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>lr', vim.lsp.buf.rename)
    nmap('<leader>la', vim.lsp.buf.code_action)
    nmap('<leader>lf', vim.lsp.buf.format)

    nmap('gd', vim.lsp.buf.definition)
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>fs', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
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

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
nvim_lsp["sumneko_lua"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = require('lspconfig.util').root_pattern('.git'),
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
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
