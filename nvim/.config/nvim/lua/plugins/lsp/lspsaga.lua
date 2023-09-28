require("lspsaga").setup({
    finder = {
        max_height = 0.5, --percentage
        force_max_height = false,
        keys = {
            edit = { "l", "<CR>" },
            vsplit = "L",
            tabe = "t",
        },
    },
    rename = {
        quit = "<ESC>",
    },
    code_action = {
        num_shortcut = true,
        show_server_name = true,
        extend_gitsigns = false,
        keys = {
            quit = { "q", "<ESC>" },
            exec = { "l", "<CR>" },
        },
    },
})
