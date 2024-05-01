return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			enabled = true,
			cloak_character = "X",
			highlight_group = "Comment",
			cloak_length = 40,
			try_all_patterns = true,
			patterns = {
				{
					file_pattern = { ".env*", "*.fish" },
					cloak_pattern = { "=.+", "gx.+" },
				},
			},
		})
	end,
}
