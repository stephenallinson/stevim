return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = { "icon" },
			keymaps = {
				["<C-.>"] = "actions.toggle_hidden",
			},
			view_options = {
				show_hidden = false,
			},
			watch_for_changes = true,
			float = {
				padding = 0,
				max_width = 60,
				max_height = 16,
			},
			vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open in Oil" }),
		})
	end,
}
