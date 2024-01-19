return {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    cmd = "Gitsigns",

    config = function()
        require("gitsigns").setup({
            signs = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            update_debounce = 200,
            max_file_length = 40000,
            preview_config = {
                border = 'single',
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        })
    end
}
