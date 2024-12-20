return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup {
            pickers = {
                find_files = {
                    theme = "ivy"
                },
                git_files = {
                    theme = "ivy"
                },
            },
            extensions = {
                fzf = {}
            }
        }

        local project_files = function()
            local ok = pcall(require("telescope.builtin").git_files)
            if not ok then
                require("telescope.builtin").find_files()
            end
        end

        telescope.load_extension('fzf')

        -- KEYMAPS
        vim.keymap.set("n", "<leader>ff", project_files)
        vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
        vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
        vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
        vim.keymap.set("n", "<leader>fc", function()
            require('telescope.builtin').find_files {
                cwd = vim.fn.stdpath("config")
            }
        end)
    end,
}
