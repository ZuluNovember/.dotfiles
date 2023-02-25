return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "go", "javascript", "help", "typescript", "lua", "rust" },
				sync_install = false,
				ignore_install = { "" },
				autopairs = {
					enable = true,
				},
				highlight = {
					enable = true,
					disable = { "" },
					additional_vim_regex_highlighting = true,
				},
				indent = { enable = true, disable = { "yaml" } },
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			})
		end,
	},
	{
		"nvim-treesitter/playground",
	},
}
