return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"linrongbin16/lsp-progress.nvim",
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "onedark",
			component_separators = "|",
			section_separators = "",
			globalstatus = true,
		},
		sections = {
			lualine_c = {
				{
					"filename",
					file_status = true,
					newfile_status = false,
					path = 4,
					symbols = {
						modified = "[+]",
						readonly = "[-]",
					},
				},
			},
		},
	},
}
