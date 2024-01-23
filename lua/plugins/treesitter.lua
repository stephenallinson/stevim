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
                "rust",
                "vimdoc",
                "fish",
                "bash",
                "markdown",
                "markdown_inline",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            sync_install = false,
            ignore_install = {},
        })
    end,
}
