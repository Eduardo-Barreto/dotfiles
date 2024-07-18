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
		"barrett-ruth/live-server.nvim",
		build = "yarn global add live-server",
		config = function()
			require("live-server").setup({})
		end,
	},
}
