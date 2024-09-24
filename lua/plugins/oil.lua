return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			float = {
				padding = 2,
				max_width = 90,
				max_height = 0,
			},
			win_options = {
				wrap = true,
				winblend = 0,
			},
			columns = { "icon" },
			keymaps = {
				["<C-.>"] = "actions.toggle_hidden",
				["q"] = "actions.close",
				["<Backspace>"] = "actions.parent",
			},
			watch_for_changes = true,
			vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open in Oil" }),
		})
	end,
}
