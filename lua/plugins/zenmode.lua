return {
    "folke/zen-mode.nvim" ,
    config = function()
        require("zen-mode").setup({
            window = {
                options = {
                    signcolumn = "no",
                    number = true,
                    relativenumber = true,
                    cursorline = false,
                    cursorcolumn = false,
                    foldcolumn = "0",
                    list = false,
                }
            },
            plugins ={
                alacritty = {
                    enabled = true,
                    font = "14",
                },
            },
        })
    end
}
