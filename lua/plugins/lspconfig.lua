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
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				require("lspconfig").lua_ls.setup({
					settings = { Lua = { diagnostics = { globals = { "vim" } } } },
				}),
			})
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
					"beautysh",
					"eslint_d",
					"golangci-lint",
					"htmlbeautifier",
					"jsonlint",
					"luacheck",
					"prettier",
					"prettierd",
					"ruff-lsp",
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
			{ "folke/neodev.nvim" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			-- Global Keymaps
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
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
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<space>f", function()
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
