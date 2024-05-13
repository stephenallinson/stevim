return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 0.35,
				width = 0.95,
				height = 1,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
					cursorline = false,
					cursorcolumn = false,
					foldcolumn = "0",
					list = false,
				},
			},
			plugins = {
				gitsigns = {
					enabled = false,
				},
			},
		})
	end,
}
