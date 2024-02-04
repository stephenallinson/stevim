return {
	"nvimdev/dashboard-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
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
		require("dashboard").setup({
			theme = "hyper",
			shortcut_type = "number",
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
				},
				packages = { enable = true },
				mru = { limit = 8, icon = "  ", label = "Recent Files", cwd_only = false },
				project = {
					enable = true,
					limit = 4,
					icon = "  ",
					label = "Projects",
					action = "Telescope find_files cwd=",
				},
			},
			hide = {
				statusline = true,
				tabline = true,
				winbar = true,
			},
		})
	end,
}
