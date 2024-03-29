return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'rafamadriz/friendly-snippets',
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path",   -- source for file system paths in commands
        "zbirenbaum/copilot-cmp",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require('lspkind')

        vim.opt.completeopt = "menu,menuone,noselect"

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping.select_next_item(),   -- next suggestion
                ["<Tab>"] = cmp.mapping.select_next_item(),   -- next suggestion
                ["<C-k>"] = cmp.mapping.select_prev_item(),   -- previous suggestion
                ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = {
                { name = "codeium" },
                {
                    name = "nvim_lsp",
                    entry_filter = function(entry, ctx)
                        local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
                        if kind == "Snippet" and ctx.prev_context.filetype == "java" then
                            return false
                        end
                        if ctx.prev_context.filetype == "markdown" then
                            return true
                        end
                        if kind == "Text" then
                            return false
                        end
                        return true
                    end
                },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                expandable_indicator = true,
                format = lspkind.cmp_format({
                    mode = 'symbol',
                    maxwidth = 50,
                    ellipsis_char = '...',
                    symbol_map = { Codeium = "", }
                })
            },
            window = {
                completion = {
                    border = "single",
                    winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
                    col_offset = -1,
                    side_padding = 0,
                    scrollbar = false,
                    scrolloff = 3,
                },
                documentation = {
                    border = "single",
                    winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None"
                }
            }
        })
    end,
}
