vim.cmd [[
try
  colorscheme onigiri
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme gruvbox
endtry
]]

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })
