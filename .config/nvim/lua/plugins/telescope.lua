return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		local file_browser = require("telescope").extensions.file_browser.file_browser
		local fb_actions = require("telescope").extensions.file_browser.actions

		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				["file_browser"] = {
					theme = "dropdown",
					hijack_netrw = true,
					mappings = {
						["n"] = {
							["h"] = fb_actions.goto_parent_dir,
							["C"] = fb_actions.create,
						},
					},
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "file_browser")

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		-- open fuzzy finder for current buffer
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				--				winblend = 10,
				--				previewer = false,
			}))
			end, { desc = "[/] Fuzzily search in current buffer" })

		-- open file browser in current buffer
		vim.keymap.set("n", "<leader>fb", function()
			file_browser({
				path = "%:p:h",
				cwd = vim.fn.expand("%:p:h"),
				hidden = true,
				grouped = true,
				previewer = true,
				initial_mode = "normal",
				prompt_position = "bottom",
				preview_height = 10,
				layout_config = {
					height = 20,
				},
			})
			end, { desc = "[F]ile [B]rowser (path = current folder)" })

	end,
}
