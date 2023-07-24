vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
]])

-- auto insert mode in terminal
vim.cmd([[autocmd BufEnter * if &buftype ==# 'terminal' | startinsert! | endif]])
vim.cmd([[autocmd TermOpen * startinsert]])
