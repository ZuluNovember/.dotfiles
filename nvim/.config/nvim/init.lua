if vim.g.vscode then
    require("options")
    require("keymaps")
else
    require("options")
    require("keymaps")
    require("plugin")
    require("colors")
end
