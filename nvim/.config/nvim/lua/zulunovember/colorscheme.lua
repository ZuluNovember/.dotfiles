vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent_background = 1
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.opt.background = "dark" -- or "light" for light mode

require('onedark').setup {
    style = 'darker'
}

vim.cmd [[
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme tokyonight
endtry
]]
