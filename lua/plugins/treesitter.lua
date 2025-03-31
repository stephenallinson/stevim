return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"python",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"rust",
				"vimdoc",
				"fish",
				"bash",
				"markdown",
				"markdown_inline",
				"powershell",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			sync_install = false,
			ignore_install = {},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>",
					node_incremental = "<Enter>",
					scope_incremental = false,
					node_decremental = "<C-Enter>",
				},
			},
		})

		local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		treesitter_parser_config.powershell = {
			install_info = {
				url = "https://github.com/airbus-cert/tree-sitter-powershell",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "main",
				generate_requires_npm = false,
				requires_generate_from_grammar = false,
			},
			filetype = "ps1",
		}
	end,
}
