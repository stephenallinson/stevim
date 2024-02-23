return {
	"stevearc/aerial.nvim",
	dependenceies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			vim.keymap.set("n", "<leader>{{", "<cmd>AerialToggle<cr>", { desc = "Toggle Aerial" }),
		})
	end,
}
