return {
	{
		"linux-cultist/venv-selector.nvim",
		cmd = "VenvSelect",
		config = function()
			require("venv-selector").setup()
			vim.keymap.set("n", "<leader>pv", "<cmd>:VenvSelect<cr>", { desc = "Select VirtualEnv" })
		end,
	},
}
