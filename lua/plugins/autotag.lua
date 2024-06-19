return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable = true,
				enable_rename = true,
				enable_close = false,
				enable_close_on_slash = false,

				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
					"tsx",
					"jsx",
					"rescript",
					"xml",
					"php",
					"markdown",
					"astro",
					"glimmer",
					"handlebars",
					"hbs",
					"go",
					"templ",
				},
			},
		})
	end,
}
