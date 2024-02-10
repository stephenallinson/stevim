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
					"gopls",
					"lua_ls",
					"pyright",
					"ruff_lsp",
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
					"eslint_d",
					"golangci-lint",
					"goimports-reviser",
					"golines",
					"htmlbeautifier",
					"jsonlint",
					"luacheck",
					"mypy",
					"prettier",
					"prettierd",
					"ruff",
					"shellcheck",
					"stylua",
					"vale",
					"yamlfix",
					"yamllint",
				},
				auto_update = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Lua LSP
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			-- Go LSP
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			-- Python LSP
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			local ruff_on_attach = function(client, bufnr)
				client.server_capabilities.hoverProvider = false
			end
			lspconfig.ruff_lsp.setup({
				on_attach = ruff_on_attach,
			})
			-- Global Keymaps
			vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

			-- Autocmd Keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)

					-- Trouble Keymaps
					vim.keymap.set("n", "<leader>xx", function()
						require("trouble").toggle()
					end)
					vim.keymap.set("n", "<leader>xw", function()
						require("trouble").toggle("workspace_diagnostics")
					end)
					vim.keymap.set("n", "<leader>xd", function()
						require("trouble").toggle("document_diagnostics")
					end)
					vim.keymap.set("n", "<leader>xq", function()
						require("trouble").toggle("quickfix")
					end)
					vim.keymap.set("n", "<leader>xl", function()
						require("trouble").toggle("loclist")
					end)
					vim.keymap.set("n", "gR", function()
						require("trouble").toggle("lsp_references")
					end)
				end,
			})
		end,
	},
}
