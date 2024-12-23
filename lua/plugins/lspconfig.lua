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
					"bashls", -- BASH
					"docker_compose_language_service", -- Docker Compose
					"dockerls", -- Dockerfile
					"gopls", -- Go
					"lua_ls", -- Lua
					"marksman", -- Markdown
					"powershell_es", -- Powershell
					"pyright", -- Python
					"ruff", -- Python
					"taplo", -- TOML
				},
				automatic_installation = true,
			})
			-- ["lua_ls"] = function()
			-- 	require("lspconfig").lua_ls.setup({
			-- 		settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			-- 	})
			-- end,
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"black",
					"beautysh",
					"delve",
					"eslint_d",
					"gofumpt", -- Go
					"golangci-lint",
					"goimports-reviser",
					"goimports", -- Go
					"golines",
					"gomodifytags", -- Go
					"htmlbeautifier",
					"impl", -- Go
					"jsonlint",
					"luacheck",
					"mypy",
					"prettier",
					"prettierd",
					"ruff",
					"shellcheck",
					"stylua",
					"yamlfix",
					"yamllint",
				},
				auto_update = true,
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim" },
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			automatic_installation = true,
			handlers = {},
			ensure_installed = {
				"delve",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "saghen/blink.cmp" },
		},
		config = function()
			local lspconfig = require("lspconfig")
			-- Set the capabilities (either CMP, or Blink)
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- Markdown LSP
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			-- Lua LSP
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			-- Go LSP
			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
							unusedvariable = true,
						},
						codelenses = {
							tidy = true,
							upgrade_dependency = true,
							vulncheck = true,
						},
						hints = {
							assignVariableTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						semanticTokens = false,
						staticcheck = true,
						gofumpt = true,
					},
				},
			})
			-- Python LSP
			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					pyright = {
						-- Disable pyright organizer in favour of ruff
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- Ignore all file analysis in favour of ruff
							ignore = { "*" },
						},
					},
				},
			})
			local ruff_on_attach = function(client, _)
				client.server_capabilities.hoverProvider = false
			end
			lspconfig.ruff.setup({
				on_attach = ruff_on_attach,
			})
			-- TOML LSP
			lspconfig.taplo.setup({
				capabilities = capabilities,
			})
			-- BASH LSP
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			-- Docker LSP
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
				settings = { docker = { languageserver = { formatter = { ignoreMultilineInstructions = true } } } },
			})
			-- Powershell LSP
			lspconfig.powershell_es.setup({
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
				end,
				bundle_path = "~/.local/share/nvim/mason/packages/powershell-editor-services",
				settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
				init_options = {
					enableProfileLoading = false,
				},
			})
			-- Global Keymaps
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

			-- Autocmd Keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings
					local opts = { buffer = ev.buf }
					local builtin = require("telescope.builtin")
					-- Telescope Keymaps
					vim.keymap.set("n", "gr", builtin.lsp_references, opts)
					vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
					vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, opts)
					vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
					vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, opts)

					-- Default VIM LSP Buffer Keymaps
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
			local default_diagnostic_config = {
				signs = {
					active = true,
					values = {
						{ name = "DiagnosticSignError", text = " " },
						{ name = "DiagnosticSignWarn", text = " " },
						{ name = "DiagnosticSignHint", text = "󰌶 " },
						{ name = "DiagnosticSignInfo", text = " " },
					},
				},
				virtual_text = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}

			vim.diagnostic.config(default_diagnostic_config)

			for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
			end

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
			require("lspconfig.ui.windows").default_options.border = "rounded"
		end,
	},
}
