-- List of favorite files/marks per project
return {
	-- https://github.com/ThePrimeagen/harpoon
	"ThePrimeagen/harpoon",
	branch = "master",
	dependencies = {
		-- https://github.com/nvim-lua/plenary.nvim
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("harpoon").setup({
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			},
		})
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		-- Keymaps
		vim.keymap.set({ "n", "i" }, "<M-`>", ui.toggle_quick_menu)
		vim.keymap.set({ "n", "i" }, "<M-a>", mark.add_file)
		vim.keymap.set({ "n", "i" }, "<M-Tab>", ui.nav_next)
		vim.keymap.set("n", "<M-1>", function()
			ui.nav_file(1)
		end, { desc = "Harpoon 1" })
		vim.keymap.set("n", "<M-2>", function()
			ui.nav_file(2)
		end, { desc = "Harpoon 2" })
		vim.keymap.set("n", "<M-3>", function()
			ui.nav_file(3)
		end, { desc = "Harpoon 3" })
		vim.keymap.set("n", "<M-4>", function()
			ui.nav_file(4)
		end, { desc = "Harpoon 4" })
	end,
}
