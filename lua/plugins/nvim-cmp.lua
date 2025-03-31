local trigger_text = ";"

return {
	{
		"saghen/blink.cmp",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
			{
				"saghen/blink.compat",
				-- use the latest release, via version = '*', if you also use the latest release for blink.cmp
				version = "*",
				-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
				lazy = true,
				-- make sure to set opts so that lazy.nvim calls blink.compat's setup
				opts = {
					enable_events = true,
				},
			},
		},
		version = "*",
		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },

				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },

				["<S-k>"] = { "scroll_documentation_up", "fallback" },
				["<S-j>"] = { "scroll_documentation_down", "fallback" },

				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
			},
			appearance = { use_nvim_cmp_as_default = true },
			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				providers = {
					snippets = {
						name = "snippets",
						enabled = true,
						max_items = 10,
						min_keyword_length = 2,
						module = "blink.cmp.sources.snippets",
						-- Configure so that trigger text does not appear in snipper reveal
						should_show_items = function()
							local col = vim.api.nvim_win_get_cursor(0)[2]
							local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
							return before_cursor:match(trigger_text .. "%w*$") ~= nil
						end,
						transform_items = function(_, items)
							local col = vim.api.nvim_win_get_cursor(0)[2]
							local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
							local trigger_pos = before_cursor:find(trigger_text .. "[^" .. "]*$")
							if trigger_pos then
								for _, item in ipairs(items) do
									if not item.trigger_text_modified then
										---@diagnostic disable-next-line: inject-field
										item.trigger_text_modified = true
										item.textEdit = {
											newText = item.insertText or item.label,
											range = {
												start = { line = vim.fn.line(".") - 1, character = trigger_pos - 1 },
												["end"] = { line = vim.fn.line(".") - 1, character = col },
											},
										}
									end
								end
							end
							return items
						end,
					},
				},
			},
			completion = {
				menu = { border = "rounded" },
				documentation = { window = { border = "rounded" } },
				ghost_text = { enabled = false },
			},
			signature = {
				enabled = true,
				window = { border = "rounded" },
			},
		},
	},
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	event = "InsertEnter",
	-- 	dependencies = {
	-- 		"garymjr/nvim-snippets",
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-path",
	-- 		"rafamadriz/friendly-snippets",
	-- 		"hrsh7th/cmp-buffer", -- source for text in buffer
	-- 		"hrsh7th/cmp-path", -- source for file system paths in commands
	-- 		"onsails/lspkind.nvim",
	-- 		"Exafunction/codeium.nvim",
	-- 		{
	-- 			"MattiasMTS/cmp-dbee",
	-- 			dependencies = { "kndndrj/nvim-dbee" },
	-- 			ft = "sql",
	-- 			opts = {},
	-- 		},
	-- 	},
	-- 	keys = {
	-- 		{
	-- 			"<Tab>",
	-- 			function()
	-- 				return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
	-- 			end,
	-- 			expr = true,
	-- 			silent = true,
	-- 			mode = { "i", "s" },
	-- 		},
	-- 		{
	-- 			"<S-Tab>",
	-- 			function()
	-- 				return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<S-Tab>"
	-- 			end,
	-- 			expr = true,
	-- 			silent = true,
	-- 			mode = { "i", "s" },
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		local cmp = require("cmp")
	-- 		local lspkind = require("lspkind")
	--
	-- 		cmp.setup({
	-- 			preselect = cmp.PreselectMode.None,
	-- 			completion = {
	-- 				completeopt = "menu,menuone,noselect",
	-- 			},
	-- 			expand = function(args)
	-- 				vim.snippet.expand(args.body)
	-- 			end,
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
	-- 				["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
	-- 				["<C-y>"] = cmp.mapping(
	-- 					cmp.mapping.confirm({
	-- 						behavior = cmp.ConfirmBehavior.Insert,
	-- 						select = true,
	-- 					}),
	-- 					{ "i", "c" }
	-- 				),
	-- 				["<C-e>"] = cmp.mapping.abort(), -- close completion window
	-- 				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
	-- 			}),
	-- 			sources = {
	-- 				{ name = "codeium" },
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "snippets" },
	-- 				{ name = "path" },
	-- 				{ name = "cmp-dbee" },
	-- 				{ name = "buffer" },
	-- 			},
	-- 			formatting = {
	-- 				fields = { "kind", "abbr", "menu" },
	-- 				expandable_indicator = true,
	-- 				format = lspkind.cmp_format({
	-- 					mode = "symbol",
	-- 					maxwidth = 50,
	-- 					ellipsis_char = "...",
	-- 					symbol_map = { Codeium = "󰘦 ", Copilot = " " },
	-- 				}),
	-- 			},
	-- 			window = {
	-- 				completion = cmp.config.window.bordered(),
	-- 				documentation = cmp.config.window.bordered(),
	-- 			},
	-- 			experimental = {
	-- 				-- Add ghost text auto-fill information
	-- 				ghost_text = false,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
