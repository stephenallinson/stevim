return {
	-- Telescope Extensions
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-media-files.nvim", dependencies = { "nvim-lua/popup.nvim" } },
	{ "nvim-telescope/telescope-symbols.nvim" },
	{ "AckslD/nvim-neoclip.lua", {} },
	{ "nvim-telescope/telescope-file-browser.nvim", {} },
	{ "debugloop/telescope-undo.nvim", {} },

	-- Telescope Main Config
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["q"] = require("telescope.actions").close,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
			-- Keymappings
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find via Grep" })
			vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "Find Recent Files" })
			vim.keymap.set("n", "<leader><space>", builtin.builtin, { desc = "Open Telescope" })

			-- Load extensions
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("media_files")
			require("telescope").load_extension("neoclip")
			require("telescope").load_extension("undo")
		end,
	},
}
