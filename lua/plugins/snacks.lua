return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true, notify = true },
		lazygit = { enabled = true },
		quickfile = { enabled = true },
		terminal = { enabled = false },
		zen = { enabled = false },
		image = {
			enabled = true,
			doc = {
				inline = false,
				float = true,
				max_width = 60,
				max_height = 30,
			},
		}, -- This requires ImageMagick
	},
	keys = {
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		{
			"<leader>Z",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Toggle Zoom",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Open Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
	},
}
