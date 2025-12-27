return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = {
			transparent = true, -- THIS is what enables transparency
		},
	},
	{
		"oncomouse/lushwal.nvim",
		cmd = { "LushwalCompile" },

		dependencies = {
			{ "rktjmp/lush.nvim" },
			{ "rktjmp/shipwright.nvim" },
		},
		lazy = false,
	},
}
