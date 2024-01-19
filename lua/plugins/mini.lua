return {
    {
        "echasnovski/mini.cursorword",
        version = "*",
        config = function()
            require("mini.cursorword").setup()
        end,
    },
    {
        "echasnovski/mini.hipatterns",
        version = "*",
        config = function()
            local hipatterns = require("mini.hipatterns")
            hipatterns.setup({
                highlighters = {
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })
        end,
    },
}
