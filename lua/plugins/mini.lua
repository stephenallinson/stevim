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

		-- Mini Surround
		require("mini.surround").setup({
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`
			},
		})
	end,
}
