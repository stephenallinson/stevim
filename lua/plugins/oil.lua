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
			preview = {
				max_width = { 100, 0.8 },
				min_width = { 40, 0.4 },
				max_height = 0.8,
				min_height = 0.1,
				update_on_cursor_moved = true,
			},
			vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open in Oil" }),
		})
	end,
}
