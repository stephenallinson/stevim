return {
	{
		"zbirenbaum/copilot.lua",
		dependencies = { "copilot-cmp" },
		cmd = "Copilot",
		event = "InsertEnter",
		build = ":Copilot auth",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
				filetypes = {
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = "zbirenbaum/copilot.lua",
		opts = {},
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
