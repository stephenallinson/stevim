return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"linrongbin16/lsp-progress.nvim",
		"AndreM222/copilot-lualine",
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
			lualine_x = {
				{
					"copilot",
					symbols = {
						status = {
							icons = {
								enabled = " ",
								sleep = " ", -- auto-trigger disabled
								disabled = " ",
								warning = " ",
								unknown = " ",
							},
							hl = {
								enabled = "#879A39",
								sleep = "#4385BE",
								disabled = "#878580",
								warning = "#DA702C",
								unknown = "#D14D41",
							},
						},
					},
					show_colors = true,
					show_loading = false,
				},
				"encoding",
				"fileformat",
				"filetype",
			},
		},
	},
}
