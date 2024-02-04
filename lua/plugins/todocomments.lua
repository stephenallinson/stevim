return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({
			keywords = {
				TODO = { icon = " ", color = "info" },
			},
			highlight = {
				multiline = false,
			},
			colors = {
				info = { "DiagnosticsInfo", "#CE5D97" },
			},
		})
		vim.keymap.set("n", "]t", function()
			require("todo-comments").jump_next()
		end, { desc = "Next todo comment" })
		vim.keymap.set("n", "[t", function()
			require("todo-comments").jump_prev()
		end, { desc = "Previous todo comment" })
		-- TODO: test
		vim.keymap.set("n", "<leader>tt", "<cmd>TodoTrouble<cr>", { desc = "Show in-code notes" })
	end,
}
