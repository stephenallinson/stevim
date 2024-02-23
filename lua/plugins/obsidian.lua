return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	event = {
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
	config = function()
		vim.opt.conceallevel = 1
		---@diagnostic disable-next-line: missing-fields
		require("obsidian").setup({
			workspaces = {
				{
					name = "JCA Personal",
					path = "/home/stephen/Documents/JCA Personal/",
				},
			},
			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				["gf"] = {
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
			completion = {
				nvim_cmp = true,
				min_chars = 2,
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
			new_notes_location = "current_dir",
			image_name_func = function()
				-- Prefix image names with timestamp.
				return string.format("%s-", os.time())
			end,
			follow_url_func = function(url)
				-- Open the URL in the default web browser.
				vim.fn.jobstart({ "xdg-open", url }) -- linux
			end,
			attachments = {
				img_folder = "Files/",
				img_text_func = function(client, path)
					local link_path
					local vault_relative_path = client:vault_relative_path(path)
					if vault_relative_path ~= nil then
						-- Use relative path if the image is saved in the vault dir.
						link_path = vault_relative_path
					else
						-- Otherwise use the absolute path.
						link_path = tostring(path)
					end
					local display_name = vim.fs.basename(link_path)
					return string.format("![%s](%s)", display_name, link_path)
				end,
			},
		})
		-- Keymaps
		vim.keymap.set("n", "<leader>of", ":ObsidianSearch<CR>", { desc = "[O]bsidian - [F]ind Files" })
		vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "[O]pen in [O]bsidian" })
		vim.keymap.set("n", "<leader>oq", ":ObsidianQuickSwitch<CR>", { desc = "[O]bsidian [Q]uickswitch" })
		vim.keymap.set("n", "<leader>op", ":ObsidianPasteImg<CR>", { desc = "[O]bsidian [P]aste Image" })
		vim.keymap.set("n", "<leader>op", ":ObsidianExtractNote<CR>", { desc = "[O]bsidian [E]xtract Note" })
	end,
}
