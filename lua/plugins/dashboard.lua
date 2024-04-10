return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"  ██████   █████                   █████   █████  ███                ",
			" ░░██████ ░░███                   ░░███   ░░███  ░░░                 ",
			"  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████ ",
			"  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███",
			"  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███",
			"  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███",
			"  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ ████",
			" ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("g", "  > Golang Projects", ":Neotree float dir=$HOME/goproj/<CR>"),
			dashboard.button("p", "  > Python Projects", ":Neotree float dir=$HOME/pyproj/<CR>"),
			dashboard.button("s", "  > Lazy Settings", ":Lazy<CR>"),
			dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
		}
		-- Set alpha settings
		alpha.setup(dashboard.opts)
	end,
}
-- return {
-- 	"nvimdev/dashboard-nvim",
-- 	event = "VimEnter",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		local logo = [[
-- 	  ██████   █████                   █████   █████  ███
-- 	 ░░██████ ░░███                   ░░███   ░░███  ░░░
-- 	  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████
-- 	  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███
-- 	  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███
-- 	  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███
-- 	  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████
-- 	 ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░
--         ]]
-- 		local path = vim.fn.expand("~/Documents/")
-- 		require("dashboard").setup({
-- 			theme = "hyper",
-- 			shortcut_type = "letter",
-- 			config = {
-- 				header = vim.split(logo, "\n"),
-- 				shortcut = {
-- 					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
-- 					{
-- 						icon = " ",
-- 						icon_hl = "@property",
-- 						desc = "Files",
-- 						group = "@property",
-- 						action = "Telescope find_files",
-- 						key = "f",
-- 					},
-- 					{
-- 						desc = " Search",
-- 						group = "@property",
-- 						action = "Telescope live_grep",
-- 						key = "a",
-- 					},
-- 					{
-- 						desc = " Obsidian",
-- 						group = "@property",
-- 						action = "Telescope live_grep cwd=" .. path,
-- 						key = "o",
-- 					},
-- 				},
-- 				packages = { enable = true },
-- 				mru = { limit = 6, icon = "  ", label = "Recent Files", cwd_only = false },
-- 				project = {
-- 					enable = true,
-- 					limit = 6,
-- 					icon = "  ",
-- 					label = "Projects",
-- 					action = "Telescope find_files cwd=",
-- 				},
-- 				footer = {},
-- 			},
-- 			hide = {
-- 				statusline = true,
-- 				tabline = true,
-- 				winbar = true,
-- 			},
-- 		})
-- 	end,
-- }
