return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local fmt = require("luasnip.extras.fmt").fmt

		-- Keymaps
		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			if ls.expand_or_jumpable(-1) then
				ls.expand_or_jump(-1)
			end
		end, { silent = true })

		-- Example snippet
		-- https://www.youtube.com/watch?v=FmHhonPjvvA
		ls.add_snippets("lua", {
			s(
				"hello", -- Snippet short name
				-- fmt(string inside [[ ]] block)
				-- {} to indicate position to insert
				-- Define table for replacement after string {i(n), "prefilled text"}
				fmt(
					[[
                print("hello {} world")
                ]],
					{ i(1, "default") }
				)
			),
		})

		-- Go Snippets
		ls.add_snippets("go", {
			s(
				"iferr",
				fmt(
					[[
                if err != nil {{
                    {}
                }}
                ]],
					{ i(1, "log.Fatal(err)") }
				)
			),
		})
	end,
}
