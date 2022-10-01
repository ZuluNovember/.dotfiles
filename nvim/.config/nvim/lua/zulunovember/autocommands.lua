local openTelescope = function ()
  if (vim.api.nvim_buf_get_name(0) == "") then
    require('user.telescope-config').project_files()
  end
end

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
  -- augroup _lsp
  --   autocmd!
  --   autocmd BufWritePre * lua vim.lsp.buf.formatting()
  -- augroup end

vim.api.nvim_create_autocmd({"VimEnter"}, {
  pattern = {"*"},
  callback = openTelescope
})
