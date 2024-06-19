return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("trouble").setup({
			position = "bottom",
			height = 10,
		})
		-- Trouble Keymaps
		vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true<CR>")
		vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle focus=true<CR>")
		vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle focus=true<CR>")
		vim.keymap.set("n", "<leader>xR", "<cmd>Trouble lsp_references toggle focus=true<CR>")
	end,
}
