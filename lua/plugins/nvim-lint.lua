return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"folke/neodev.nvim",
	},
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			bash = { "shellcheck" },
			fish = { "fish" },
			go = { "golangcilint" },
			html = { "htmlhint" },
			javascript = { "eslint_d" },
			json = { "jsonlint" },
			lua = { "luacheck" },
			markdown = { "vale" },
			python = { "ruff" },
			typescript = { "eslint_d" },
			yaml = { "yamllint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
