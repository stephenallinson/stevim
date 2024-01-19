return {
    "navarasu/onedark.nvim",
    lazy = false,
    name = "onedark",
    priority = 1000,
    config = function()
        require('onedark').setup {
            style = "darker",
            transparent = true,
            term_colors = true,
            ending_tildes = false,
            code_style = {
                comments = "none",
            }
        }
        vim.cmd.colorscheme "onedark"
        -- vim.cmd.highlight "Normal guibg=NONE"
    end
}
