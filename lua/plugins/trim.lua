return {
	"cappyzawa/trim.nvim",
	config = function()
		require("trim").setup({
			ft_blocklist = { "markdown" },
			trim_on_write = true,
			trim_trailing = true,
			trim_last_line = true,
			trim_first_line = true,
			highlight = false,
			-- highlight_bg = "red",
		})
	end,
}
