local M = {}

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>lr", "<cmd>Lspsaga rename<CR>")
    nmap("<leader>la", "<cmd>Lspsaga code_action<CR>")
    nmap("<leader>lf", vim.lsp.buf.format)

    nmap("gd", "<cmd>Lspsaga goto_definition<CR>")
    nmap("gr", "<cmd>Lspsaga finder<CR>")
    nmap("gI", vim.lsp.buf.implementation, "[g]oto [I]mplementation")
    nmap("gl", "<cmd>Lspsaga show_line_diagnostics<CR>")
    nmap("gT", "<cmd>Lspsaga goto_type_definition<CR>", "[g]oto [T]ype")

    nmap("<leader>en", "<cmd>Lspsaga diagnostic_jump_next<CR>")
    nmap("<leader>ep", "<cmd>Lspsaga diagnostic_jump_prev<CR>")

    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")
    nmap("<leader>fs", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[f]ind [s]ymbols")

    nmap("K", "<cmd>Lspsaga hover_doc<CR>", "Hover Documentation")
    -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation') needs remap

    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

    -- autocmd
    vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
            vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
        end
    })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local nvim_lsp = require("lspconfig")
local lsp_flags = {
    debounce_text_changes = 150,
}

nvim_lsp["tsserver"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = require("lspconfig.util").root_pattern(".git"),
})

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
nvim_lsp["lua_ls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = require("lspconfig.util").root_pattern(".git"),
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
})

nvim_lsp["gopls"].setup({
    cmd = {"gopls", "serve"},
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "go", "gomod" },
    root_dir = require("lspconfig.util").root_pattern("go.mod", ".git"),
    flags = lsp_flags,
    settings = {
        ["gopls"] = {
            usePlaceholders = false,
            buildFlags = { "-tags=integration" },
            gofumpt = true,
            ["local"] = "github.com/BiTaksi",
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    init_options = {
        buildFlags = { "-tags=integration" },
    },
})

nvim_lsp["pyright"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

nvim_lsp["eslint"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = require("lspconfig.util").root_pattern(".git"),
})

nvim_lsp["rust_analyzer"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = require("lspconfig.util").root_pattern("Cargo.toml"),
})

nvim_lsp["clangd"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
})


return M
