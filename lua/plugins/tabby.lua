return {
	"nanozuki/tabby.nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Tabby Configuration
		vim.o.showtabline = 2 -- Always show tabs
		vim.keymap.set("n", "<leader><Tab><Tab>", "<Cmd>tabnew<CR>", { noremap = true, desc = "Tab - New" })
		vim.keymap.set("n", "<leader><Tab>l", "<Cmd>tabnext<CR>", { noremap = true, desc = "Tab - Next" })
		vim.keymap.set("n", "<leader><Tab>h", "<Cmd>tabprev<CR>", { noremap = true, desc = "Tab - Prev" })
		vim.keymap.set("n", "<leader><Tab>x", "<Cmd>tabclose<CR>", { noremap = true, desc = "Tab - Close" })

		local theme = {
			fill = "TablineFill",
			head = "TabLine",
			current_tab = "TabLineSel",
			tab = "TabLine",
			win = "TabLine",
			tail = "TabLine",
		}
		require("tabby.tabline").set(function(line)
			return {
				{
					{ "  ", hl = theme.head },
					line.sep("|", theme.head, theme.fill),
				},
				line.tabs().foreach(function(tab)
					local hl = tab.is_current() and theme.current_tab or theme.tab
					return {
						line.sep("|", hl, theme.fill),
						tab.is_current() and "" or "󰆣",
						tab.number(),
						tab.name(),
						tab.close_btn(""),
						line.sep("|", hl, theme.fill),
						hl = hl,
						margin = " ",
					}
				end),
				line.spacer(),
				line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
					return {
						line.sep("|", theme.win, theme.fill),
						win.is_current() and "" or "",
						win.buf_name(),
						line.sep("|", theme.win, theme.fill),
						hl = theme.win,
						margin = " ",
					}
				end),
				{
					line.sep("|", theme.tail, theme.fill),
					{ "  ", hl = theme.tail },
				},
				hl = theme.fill,
			}
		end)
	end,
}
