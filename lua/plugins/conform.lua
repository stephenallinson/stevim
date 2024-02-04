return {
    "stevearc/conform.nvim",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                bash = { "beautysh" },
                css = { { "prettierd", "prettier" } },
                html = { "htmlbeautifier" },
                javascript = { { "prettierd", "prettier" } },
                json = { { "prettierd", "prettier" } },
                lua = { "stylua" },
                markdown = { { "prettierd", "prettier" } },
                python = { "ruff" },
                scss = { { "prettierd", "prettier" } },
                typescript = { { "prettierd", "prettier" } },
                yaml = { "yamlfix" },
                fish = { "fish_indent" },
                go = { "gofmt" },
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
