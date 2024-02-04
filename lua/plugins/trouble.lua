return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup({
            position = "bottom",
            height = 10,
        })
        -- Keymaps
        local trouble = require("trouble")
        vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end)
        vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end)

        -- Telescope Configuration
        local telescope_trouble = require("trouble.providers.telescope")
        local telescope = require("telescope")
        telescope.setup {
            defaults = {
                mappings = {
                    i = { ["<C-t>"] = telescope_trouble.open_with_trouble },
                    n = { ["<C-t>"] = telescope_trouble.open_with_trouble },
                },
            },
        }
    end
}
