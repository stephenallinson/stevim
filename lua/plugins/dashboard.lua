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
			dashboard.button("e", "  > New file", "<CMD>ene!<CR>"),
			dashboard.button("f", "  > Find file", "<CMD>Telescope find_files<CR>"),
			dashboard.button("r", "  > Recent", "<CMD>Telescope oldfiles<CR>"),
			dashboard.button("s", "  > Lazy Settings", "<CMD>Lazy<CR>"),
			dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
		}
		-- Set alpha settings
		alpha.setup(dashboard.opts)
	end,
}
