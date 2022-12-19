vim.cmd [[
try
  colorscheme oh-lucy
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme gruvbox
endtry
]]
