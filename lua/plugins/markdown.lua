return {
	{
		"plasticboy/vim-markdown",
		dependencies = "godlygeek/tabular",
		ft = "markdown",
		event = "VeryLazy",
		config = function()
			vim.g.vim_markdown_auto_insert_bullets = 0
			vim.g.vim_markdown_borderless_table = 1
			vim.g.vim_markdown_conceal = 1
			vim.g.vim_markdown_conceal_code_blocks = 1
			vim.g.vim_markdown_edit_url_in = "tab"
			vim.g.vim_markdown_folding_disabled = 1
			vim.g.vim_markdown_follow_anchor = 1
			vim.g.vim_markdown_frontmatter = 1
			vim.g.vim_markdown_math = 1
			vim.g.vim_markdown_new_list_item_indent = 0
			vim.g.vim_markdown_strikethrough = 1
			vim.g.vim_markdown_toc_autofit = 1

			vim.g.tex_conceal = ""

			-- Amazing Keymap found here: https://heitorpb.github.io/bla/format-tables-in-vim/
			vim.keymap.set("x", "<leader>f", ":! tr -s \" \" | column -t -s '|' -o '|'<CR>", { silent = true })
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		config = function()
			require("render-markdown").setup({
				render_modes = { "n", "c" },
				anti_conceal = { enabled = true },
				heading = {
					position = "inline",
					width = "block",
					min_width = 80,
					sign = false,
					icons = { "󰝤" },
				},
				bullet = {
					highlight = "RenderMarkdownError",
				},
				quote = {
					enabled = true,
					icon = "▋",
					highlight = "RenderMarkdownInfo",
				},
				checkbox = {
					checked = { icon = "✔ " },
				},
				code = {
					enabled = true,
					sign = false,
					width = "block",
					min_width = 80,
					left_pad = 2,
					right_pad = 4,
				},
				pipe_table = {
					preset = "heavy",
					head = "RenderMarkdownTableRow",
					min_width = 12,
				},
				overrides = {
					buftype = {
						nofile = {
							code = { left_pad = 0, right_pad = 0 },
						},
					},
				},
			})
		end,
	},
}
