return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", function()
			require("neo-tree.command").execute({ toggle = true, position = "float", reveal_force_cwd = true })
		end, { desc = "Open NeoTree" })
		vim.g.loaded = 1
		vim.g.loaded_netrwPlugin = 1
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_by_name = {
						".DS_Store",
						"thumbs.db",
					},
				},
				window = {
					mappings = {
						["<F5>"] = "refresh",
					},
					position = "current",
				},
				bind_to_cwd = true,
				hijack_netrw_behavior = "open_default",
			},
		})
	end,
}
