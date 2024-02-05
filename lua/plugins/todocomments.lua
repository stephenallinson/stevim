return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({
			merge_keywords = true,
			keywords = {
				FIX = {
					icon = " ",
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = { icon = " ", color = "info", alt = { "todo" } },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = "󱋆 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = "󰎚 ", color = "hint", alt = { "INFO" } },
				TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			gui_style = {
				fg = "NONE",
				bg = "BOLD",
			},
			highlight = {
				comments_only = false,
				multiline = false,
				before = "fg",
				after = "fg",
				pattern = { [[#<(KEYWORDS)\s*]], [[.*<(KEYWORDS)\s*:]] },
			},
			colors = {
				-- FIX:: example
				error = { "#AF3029" },

				-- TODO: example
				info = { "#205EA6" },

				-- HACK: example
				-- WARN: example
				warning = { "#AD8301" },

				-- NOTE: example
				hint = { "#24837B" },

				-- TEST: example
				test = { "#A02F6F" },

				-- PERF: example
				default = { "#5E409D" },
			},
			search = {
				pattern = [[\b(KEYWORDS):|#(KEYWORDS)\b]],
			},
		})
		vim.keymap.set("n", "]t", function()
			require("todo-comments").jump_next()
		end, { desc = "Next todo comment" })
		vim.keymap.set("n", "[t", function()
			require("todo-comments").jump_prev()
		end, { desc = "Previous todo comment" })
		vim.keymap.set("n", "<leader>tt", "<cmd>TodoTrouble<cr>", { desc = "Show in-code notes" })
	end,
}
