return {
	{
		dir = "/home/stephen/nvimproj/flex.nvim",
		lazy = false,
		name = "onedark",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "dark",
				transparent = true,
				term_colors = true,
				ending_tildes = false,
				code_style = {
					comments = "none",
				},
			})
			vim.cmd.colorscheme("onedark")
		end,
	},
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	lazy = false,
	-- 	name = "onedark",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			style = "darker",
	-- 			transparent = true,
	-- 			term_colors = true,
	-- 			ending_tildes = false,
	-- 			code_style = {
	-- 				comments = "none",
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("onedark")
	-- 	end,
	-- },
	-- TODO: Keep up to date on this
	-- {
	-- 	"stephenallinson/flexoki-neovim",
	-- 	name = "flexoki",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("flexoki").setup({
	-- 			variant = "auto",
	-- 			highlight_groups = {
	-- 				base = {
	--                        Comment = { italic = false },
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("flexoki-dark")
	-- 	end,
	-- },
}
