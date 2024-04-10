return {
	{
		"navarasu/onedark.nvim",
		lazy = false,
		name = "onedark",
		priority = 1000,
		config = function()
			require("onedark").setup({
				-- INFO: https://stephango.com/flexoki colorscheme
				colors = {
					black = "#100F0F",
					bg0 = "#1C1B1A",
					bg1 = "#31353f",
					bg2 = "#393f4a",
					bg3 = "#3b3f4c",
					bg_d = "#21252b",
					bg_blue = "#205EA6",
					bg_yellow = "#D0A215",
					fg = "#abb2bf",
					purple = "#8B7EC8",
					green = "#879A39",
					orange = "#DA702C",
					blue = "#4385BE",
					yellow = "#D0A215",
					cyan = "#3AA99F",
					red = "#D14D41",
					grey = "#575653",
					light_grey = "#878580",
					dark_cyan = "#24837B",
					dark_red = "#AF3029",
					dark_yellow = "#AD8301",
					dark_purple = "#5E409D",
					diff_add = "#31392b",
					diff_delete = "#382b2c",
					diff_change = "#1c3448",
					diff_text = "#2c5372",
				},
				highlights = {
					CursorLine = { bg = "#282726" },
					["@markup.heading.1.markdown"] = { fg = "$red" },
					["@markup.heading.2.markdown"] = { fg = "$orange" },
					["@markup.heading.3.markdown"] = { fg = "$yellow" },
					["@markup.heading.4.markdown"] = { fg = "$green" },
				},
				transparent = false,
				term_colors = true,
				ending_tildes = false,
				code_style = {
					comments = "none",
				},
				diagnostics = {
					darker = true,
					undercurl = true,
					background = true,
				},
			})
			vim.cmd.colorscheme("onedark")
		end,
	},
}
