return {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- TODO: find a replacement for beautsh as it is incompatibel with Python 3.12
				-- sh = { "beautysh" },
				-- bash = { "beautysh" },
				css = { { "prettierd", "prettier" } },
				fish = { "fish_indent" },
				go = { "goimports-reviser", "golines", "gofmt" },
				html = { "htmlbeautifier" },
				javascript = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				lua = { "stylua" },
				-- markdown = { { "prettierd", "prettier" } },
				python = { "ruff_format", "ruff_fix" },
				scss = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				toml = { "taplo" },
				yaml = { "yamlfix" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
			notify_on_error = true,
		})
		vim.keymap.set("n", "<leader>F", require("conform").format, { desc = "Format file" })
	end,
}
