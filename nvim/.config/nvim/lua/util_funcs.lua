local M = {}

-- Open a floating terminal with the given command
function M.open_float_terminal(cmd)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(bufnr, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "single",
    })

    -- close mapping
    vim.api.nvim_buf_set_keymap(bufnr, "t", "q", "<cmd>q<CR>", { noremap = true, silent = true })

    vim.fn.termopen(cmd)
end

return M
