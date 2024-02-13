return {
	"NStefan002/visual-surround.nvim",
	lazy = false,
	config = function()
		require("visual-surround").setup({
			use_default_keymaps = true,
			exit_visual_mode = true,
		})
		local preffered_mapping_prefix = "s"
		local surround_chars = { "{", "[", "(", "'", '"', "<" }
		local surround = require("visual-surround").surround
		for _, key in pairs(surround_chars) do
			vim.keymap.set("v", preffered_mapping_prefix .. key, function()
				surround(key)
			end, { desc = "[visual-surround] Surround selection with " .. key })
		end
	end,
}
