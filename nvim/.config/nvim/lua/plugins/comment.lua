return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            mappings = {
                basic = false, ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                extra = false, ---Extra mapping; `gco`, `gcO`, `gcA`
            },
        })

        vim.keymap.set('n', '<leader>lc', '<Plug>(comment_toggle_linewise_current)')
        vim.keymap.set('x', '<leader>lc', '<Plug>(comment_toggle_linewise_visual)')
    end
}
