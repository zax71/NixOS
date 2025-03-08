return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- completion source for text in the current buffer
        "hrsh7th/cmp-path", -- completion source for file system paths
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        -- Load vscode style snippets. From friendly-snippets here
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },

            -- How nvim-cmp interacts with the snippet engine
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Page down
                ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Page up
                ["<C-Space>"] = cmp.mapping.complete(), -- Show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- Close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection (enter)
            }),

            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp"}, -- lsp
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
            }),
        })
    end
}