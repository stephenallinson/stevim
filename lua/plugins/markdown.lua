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
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		ft = "markdown",
		event = "VeryLazy",
		config = function()
			vim.schedule(function()
				local hl = require("headlines")
				hl.setup({
					markdown = {
						query = vim.treesitter.query.parse(
							"markdown",
							[[
                     (atx_heading [
                       (atx_h1_marker)
                       (atx_h2_marker)
                       (atx_h3_marker)
                       (atx_h4_marker)
                       (atx_h5_marker)
                       (atx_h6_marker)
                     ] @headline)

                     (thematic_break) @dash

                     (fenced_code_block) @codeblock

                     (block_quote_marker) @quote
                     (block_quote (paragraph (inline (block_continuation) @quote)))
                   ]]
						),
						headline_highlights = {
							"Headline1",
							"Headline2",
							"Headline3",
							"Headline4",
							"Headline5",
							"Headline6",
						},
						codeblock_highlight = "CodeBlock",
						dash_highlight = "Dash",
						dash_string = "-",
						quote_highlight = "Quote",
						quote_string = "┃",
						fat_headlines = false,
						fat_headline_upper_string = "",
						fat_headline_lower_string = "",
					},
				})
				local md = hl.config.markdown
				hl.refresh()

				-- Toggle markdown headlines on insert enter/leave
				vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
					callback = function(data)
						if vim.bo.filetype == "markdown" then
							hl.config.markdown = data.event == "InsertLeave" and md or nil
							hl.refresh()
						end
					end,
				})
			end)
			vim.api.nvim_set_hl(0, "Headline2", { fg = "#c99076", bg = "#66493c", italic = false })
			vim.api.nvim_set_hl(0, "Headline3", { fg = "#80a665", bg = "#3d4f2f", italic = false })
			vim.api.nvim_set_hl(0, "Headline4", { fg = "#4c9a91", bg = "#224541", italic = false })
			vim.api.nvim_set_hl(0, "Headline5", { fg = "#6893bf", bg = "#2b3d4f", italic = false })
			vim.api.nvim_set_hl(0, "Headline6", { fg = "#d3869b", bg = "#6b454f", italic = false })
			vim.api.nvim_set_hl(0, "CodeBlock", { bg = "#444444" })
		end,
	},
}
