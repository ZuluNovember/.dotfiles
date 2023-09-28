return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate" },

				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<C-q>"] = actions.smart_send_to_qflist,
					},
					n = {},
				},
			},
			extensions = {},
		})

		local dropdown_theme = require("telescope.themes").get_dropdown({
			results_height = 20,
			winblend = 20,
			width = 0.8,
			prompt_title = "",
			prompt_prefix = "Files>",
			previewer = false,
			borderchars = {
				prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
				results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
				preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
		})

		local project_files = function()
			local ok = pcall(require("telescope.builtin").git_files, dropdown_theme)
			if not ok then
				require("telescope.builtin").find_files(dropdown_theme)
			end
		end

		-- KEYMAPS
		vim.keymap.set("n", "<leader>ff", project_files)
		vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
		vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
	end,
}
