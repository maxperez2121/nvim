return {
    -- Autocompletion
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "maxperez2121/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
            { "onsails/lspkind.nvim" },
            -- Integranciones
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-emoji" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-path" },
            { "SergioRibera/cmp-dotenv" },
            { "kdheepak/cmp-latex-symbols" },
            { "kristijanhusak/vim-dadbod-completion" },

            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "luvit-meta/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require("cmp")
            local cmp_action = lsp_zero.cmp_action()

            -- For vim-dadbod-completion
            -- Source is automatically added, you just need to include it in the chain complete list
            vim.g.completion_chain_complete_list = {
                sql = {
                    { complete_items = { "vim-dadbod-completion" } },
                },
            }
            -- Make sure `substring` is part of this list. Other items are optional for this completion source
            vim.g.completion_matching_strategy_list = { "exact", "substring" }
            -- Useful if there's a lot of camel case items
            vim.g.completion_matching_ignore_case = 1

            local lspkind = require("lspkind")

            cmp.setup({
                --formatting = lsp_zero.cmp_format({ details = true }),
                formatting = {
                    format = lspkind.cmp_format({
                        -- OPTS: 'text', 'text_symbol', 'symbol_text', 'symbol'
                        mode = "symbol_text",
                        preset = "codicons",
                        menu = {
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            --nvim_lua = "[Lua]",
                            --latex_symbols = "[Latex]",
                        },
                    }),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                }),
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources({
                    --{ name = "buffer" },
                    { name = "emoji" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "path" },
                    { name = "luasnip" },
                    {
                        name = "latex_symbols",
                        option = { strategy = 0 },
                    },
                    -- TODO: Falta separar por tipo de archivo Procfile
                    { name = "dotenv" },
                    -- TODO: Falta separar por los siguiente tipos de archivso: sql,mysql,plsql
                    { name = "vim-dadbod-completion" },
                    { name = "lazydev" },
                    {
                        name = "html-css",
                        option = {
                            enable_on = { "html" },
                            file_extensions = { "css", "sass", "less" },
                            style_sheets = {
                                "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css",
                                --"https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css",
                            },
                        },
                    },
                }),
                --filetype = {
                --lua = {
                --{ name = "lazydev" },
                --},
                --},
            })
        end,
    },
    {
        "Jezda1337/nvim-html-css",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("html-css"):setup()
        end,
    },
}
