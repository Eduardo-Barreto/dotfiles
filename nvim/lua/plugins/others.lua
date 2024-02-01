return {

	{ "nvim-lua/popup.nvim" },

	{ "nvim-lua/plenary.nvim" },

	{ "edluffy/hologram.nvim" },

	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
	},

	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},

	{ "cdelledonne/vim-cmake" },

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = "<A-j>",
						accept_word = false,
						accept_line = false,
						next = "<A-]>",
						prev = "<A-[>",
						dismiss = "<C-]>",
					},
				},
			})
		end,
	},
	{
		"barrett-ruth/live-server.nvim",
		build = "yarn global add live-server",
		config = function()
			require("live-server").setup({})
		end,
	},
}
