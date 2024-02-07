return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		"BufReadPre /home/stephen/Documents/JCA Personal/**.md",
		"BufNewFile /home/stephen/Documents/JCA Personal/**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
		"epwalsh/pomo.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "JCA Personal",
				path = "/home/stephen/obsidian/JCA Personal/",
			},
		},
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["of"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes.
			["oc"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
		},
		ui = {
			enable = true,
			update_debounce = 200,
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
			},
			bullets = { char = "•", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			-- Replace the above with this if you don't have a patched font:
			-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			hl_groups = {
				-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
				ObsidianTodo = { bold = true, fg = "#E06C75" },
				ObsidianDone = { bold = true, fg = "#98C379" },
				ObsidianRightArrow = { bold = true, fg = "#61AFEF" },
				ObsidianTilde = { bold = true, fg = "#E06C75" },
				ObsidianBullet = { bold = true, fg = "#61AFEF" },
				ObsidianRefText = { underline = true, fg = "#C678DD" },
				ObsidianExtLinkIcon = { fg = "#C678DD" },
				ObsidianTag = { italic = true, fg = "#56B6C2" },
				ObsidianHighlightText = { bg = "#E5C07B" },
			},
		},
	},
}
