return {
	"j-morano/buffer_manager.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("buffer_manager").setup({
			width = vim.api.nvim_win_get_width(0) - 40,
			highlight = "Normal:BufferManagerBorder",
			win_extra_options = {
				winhighlight = "Normal:BufferManagerNormal",
			},
		})
		-- Keymaps
		vim.keymap.set("n", "<leader>bb", require("buffer_manager.ui").toggle_quick_menu)
	end,
}
