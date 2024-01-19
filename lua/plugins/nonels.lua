return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "folke/neodev.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Mason: ansiblelint, bandit, tags, go, dotenv_linter
                -- Formatting
                null_ls.builtins.formatting.stylua, -- Lua
                null_ls.builtins.formatting.ruff, -- Python
                null_ls.builtins.formatting.isort, -- Python
                null_ls.builtins.formatting.prettierd, -- JS, HTML, JSON, YAML, MD
                null_ls.builtins.formatting.fish_indent, -- fish
                null_ls.builtins.formatting.fixjson, -- JSON
                null_ls.builtins.formatting.goimports, -- GO Imports
                null_ls.builtins.formatting.gofmt, -- Go
                null_ls.builtins.formatting.templ, -- Go templ
                null_ls.builtins.formatting.rustfmt, -- Rust
                null_ls.builtins.formatting.rustywind, -- Tailwind
                null_ls.builtins.formatting.shellharden, -- Tailwind
                null_ls.builtins.formatting.sqlfluff, -- SQL
                null_ls.builtins.formatting.stylelint, -- CSS
                null_ls.builtins.formatting.terrafmt, -- Terraform

                -- Diagnostics
                null_ls.builtins.diagnostics.todo_comments, -- To Do Highlight
                null_ls.builtins.diagnostics.ruff,   -- Python
                null_ls.builtins.diagnostics.eslint_d, -- JS, HTML, JSON, YAML, MD
                null_ls.builtins.diagnostics.ansiblelint, -- Ansible
                null_ls.builtins.diagnostics.dotenv_linter, -- Dot Env
                null_ls.builtins.diagnostics.fish,   -- Fish
                null_ls.builtins.diagnostics.golangci_lint, -- Go
                null_ls.builtins.diagnostics.gospel, -- Go Spellchecker
                null_ls.builtins.diagnostics.hadolint, -- Docker Best Practices
                null_ls.builtins.diagnostics.jsonlint, -- JSON
                null_ls.builtins.diagnostics.stylelint, -- CSS
                null_ls.builtins.diagnostics.terraform_validate, -- Terraform

                -- Completions
                null_ls.builtins.completion.luasnip, -- Snippets from LuaSnip
                null_ls.builtins.completion.tags, -- Tags

                -- Code Actions
                null_ls.builtins.code_actions.eslint_d, -- JS, TS, Vue
                null_ls.builtins.code_actions.gomodifytags, -- JS, TS, Vue

                -- Hover
                null_ls.builtins.hover.dictionary, -- Dictionary Definitions for .org, .text, .md
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format with LSP" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
        vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
    end,
}
