-- LSP Support
return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({})
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "ansiblelint",
                    "dotenv-linter",
                    "dictionary",
                    "fixjson",
                    "golangci_lint",
                    "goimports",
                    "gomodifytags",
                    "gospel",
                    "hadolint",
                    "jsonlint",
                    "luacheck",
                    "markdownlint",
                    "rustywind",
                    "shellharden",
                    "sqlfluff",
                    "stylelint",
                    "terrafmt",
                    "terraform_validate",
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                -- Update this list to the language servers you need installed
                ensure_installed = {
                    "ansiblels",
                    "bashls",
                    "cssls",
                    "docker_compose_language_service",
                    "dockerls",
                    "gopls",
                    "gradle_ls",
                    "html",
                    "jsonls",
                    "lua_ls",
                    "lemminx",
                    "marksman",
                    "powershell_es",
                    "quick_lint_js",
                    "ruff_lsp",
                    "sqlls",
                    "tailwindcss",
                    "templ",
                    "terraformls",
                    "tsserver",
                    "yamlls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            -- Useful status updates for LSP
            { "j-hui/fidget.nvim", opts = {} },
            -- Additional lua configuration, makes nvim stuff amazing!
            { "folke/neodev.nvim" },
        },
        config = function()
            require("neodev").setup()
            local lspconfig = require("lspconfig")
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            local function lsp_keymaps()
                local keymap = vim.keymap.set

                keymap("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
                keymap("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
                keymap("n", "K", vim.lsp.buf.hover, { buffer = 0 })
                keymap("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = 0 })
                keymap("n", "gI", require("telescope.builtin").lsp_implementations, { buffer = 0 })
                keymap("n", "gd", require("telescope.builtin").lsp_definitions, { buffer = 0 })
                keymap("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
                keymap("n", "gr", require("telescope.builtin").lsp_references, { buffer = 0 })
                keymap("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { buffer = 0 })
                keymap("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { buffer = 0 })
                keymap("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, { buffer = 0 })
                keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = 0 })
                keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { buffer = 0 })
                keymap("n", "<leader>wl", print(vim.inspect(vim.lsp.buf.list_workspace_folders()))({ buffer = 0 }))
            end
            -- Call setup on each LSP server
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = lsp_keymaps,
                        capabilities = lsp_capabilities,
                    })
                end,
            })
            -- Fix templ files
            vim.filetype.add({ extension = { templ = "templ" } })
            -- Lua LSP settings
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { "vim" },
                        },
                    },
                },
            })
        end,
    },
}
