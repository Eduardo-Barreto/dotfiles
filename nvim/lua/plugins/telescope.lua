return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			-- vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find file" })
            vim.keymap.set("n", "<leader>pf", function()
                builtin.find_files({ hidden = true })
            end, { desc = "Find file" })
			vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Find git file" })
			vim.keymap.set(
				"n",
				"<leader>ps",
				telescope.extensions.live_grep_args.live_grep_args,
				{ desc = "Live grep" }
			)
			telescope.load_extension("ui-select")
			telescope.load_extension("live_grep_args")
		end,
	},
}
