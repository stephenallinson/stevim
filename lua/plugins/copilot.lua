return {
	{
		"zbirenbaum/copilot.lua",
		dependencies = { "copilot-cmp" },
		cmd = "Copilot",
		event = "InsertEnter",
		build = ":Copilot auth",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = false,
						accept_word = "<M-w>",
						accept_line = "<M-l>",
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-e>",
					},
				},
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

			local copilot = require("copilot.suggestion")
			local cmp = require("cmp")

			---@param trigger boolean
			local function set_trigger(trigger)
				if not trigger and copilot.is_visible() then
					copilot.dismiss()
				end
				vim.b.copilot_suggestion_auto_trigger = trigger
				vim.b.copilot_suggestion_hidden = not trigger
			end

			-- Hide suggestions when completion menu is open
			cmp.event:on("menu_opened", function()
				set_trigger(false)
			end)
			cmp.event:on("menu_closed", function()
				set_trigger(true)
			end)
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
