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
