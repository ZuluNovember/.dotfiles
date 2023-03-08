return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "smart" },

                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },

                    n = {},
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })

        -- KEYMAPS

        local project_files = function()
            local ok = pcall(require("telescope.builtin").git_files)
            if not ok then
                require("telescope.builtin").find_files()
            end
        end

        vim.keymap.set("n", "<leader>ff", project_files)
        vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
    end,
}
