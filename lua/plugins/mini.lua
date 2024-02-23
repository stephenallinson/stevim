return {
	"echasnovski/mini.nvim",
	config = function()
		-- Mini Cursorword
		require("mini.cursorword").setup()

		-- Mini Hipatterns
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		-- Mini ai
		require("mini.ai").setup({ n_lines = 500 })
	end,
}
