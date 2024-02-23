return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local logo = [[
	  ██████   █████                   █████   █████  ███                 
	 ░░██████ ░░███                   ░░███   ░░███  ░░░                  
	  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████  
	  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███ 
	  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███ 
	  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███ 
	  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████
	 ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░ 
        ]]
		local path = vim.fn.expand("~/Documents/")
		require("dashboard").setup({
			theme = "hyper",
			shortcut_type = "letter",
			config = {
				header = vim.split(logo, "\n"),
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@property",
						desc = "Files",
						group = "@property",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Search",
						group = "@property",
						action = "Telescope live_grep",
						key = "a",
					},
					{
						desc = " Obsidian",
						group = "@property",
						action = "Telescope live_grep cwd=" .. path,
						key = "o",
					},
				},
				packages = { enable = true },
				mru = { limit = 6, icon = "  ", label = "Recent Files", cwd_only = false },
				project = {
					enable = true,
					limit = 6,
					icon = "  ",
					label = "Projects",
					action = "Telescope find_files cwd=",
				},
				footer = {},
			},
			hide = {
				statusline = true,
				tabline = true,
				winbar = true,
			},
		})
	end,
}
