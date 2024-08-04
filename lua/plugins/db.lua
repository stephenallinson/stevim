return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		require("dbee").install("go")
	end,
	config = function()
		require("dbee").setup()
		vim.keymap.set("n", "<leader>db", require("dbee").toggle)
	end,
}
