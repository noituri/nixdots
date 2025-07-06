return {
	"folke/snacks.nvim",
	opts = {
		dim = {},
	},
	keys = {
		{
			"<leader>'",
			function()
				Snacks.dim()
			end,
			desc = "Enable dim mode",
		},
		{
			"<leader>\"",
			function()
				Snacks.dim.disable()
			end,
			desc = "Disable dim mode",
		},
	},
}
