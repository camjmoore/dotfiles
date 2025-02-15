return {

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				modules = {},
				ensure_installed = { "bash", "c", "html", "lua", "markdown", "javascript", "typescript", "python", "go", "gomod", "gowork", "gosum"},
				sync_install = false,
				auto_install = true,
				ignore_install = {},
				highlight = { enable = true },
				indent = { enable = true },
			})

			-- Recommendations:
			-- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			-- Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			-- Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},
}
