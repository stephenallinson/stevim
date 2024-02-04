local M = {
    "SmiteshP/nvim-navic",
}

function M.config()
    local kinds = {
        Array = " ",
        Boolean = " ",
        Class = " ",
        Color = " ",
        Constant = " ",
        Constructor = " ",
        Enum = " ",
        EnumMember = " ",
        Event = " ",
        Field = " ",
        File = " ",
        Folder = "󰉋 ",
        Function = " ",
        Interface = " ",
        Key = " ",
        Keyword = " ",
        Method = " ",
        -- Module = " ",
        Module = " ",
        Namespace = " ",
        Null = "󰟢 ",
        Number = " ",
        Object = " ",
        Operator = " ",
        Package = " ",
        Property = " ",
        Reference = " ",
        Snippet = " ",
        String = " ",
        Struct = " ",
        Text = " ",
        TypeParameter = " ",
        Unit = " ",
        Value = " ",
        Variable = " ",
    }

    require("nvim-navic").setup({
        icons = kinds,
        highlight = true,
        lsp = {
            auto_attach = true,
        },
        click = true,
        separator = " " .. ">" .. " ",
        depth_limit = 0,
        depth_limit_indicator = "..",
    })
end

return M
