return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        dependencies = {
            "jay-babu/mason-nvim-dap.nvim",
            "stevearc/dressing.nvim",
        },
        config = function()
            require("mason").setup()
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            --{'hrsh7th/cmp-nvim-lsp'},
            { "williamboman/mason-lspconfig.nvim" },
            --{
            --"VidocqH/lsp-lens.nvim",
            --config = function()
            --local SymbolKind = vim.lsp.protocol.SymbolKind

            --require("lsp-lens").setup({
            --enable = true,
            --include_declaration = false, -- Reference include declaration
            --sections = { -- Enable / Disable specific request, formatter example looks 'Format Requests'
            --definition = false,
            --references = true,
            --implements = true,
            --git_authors = true,
            --},
            --ignore_filetype = {
            --"prisma",
            --},
            ---- Target Symbol Kinds to show lens information
            --target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
            ---- Symbol Kinds that may have target symbol kinds as children
            --wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
            --})
            --end,
            --},
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.set_sign_icons({
                --error = "",
                --warn = "⚠⚠️▲",
                --hint = "⚑",
                --info = "»",
                error = "",
                warn = "",
                hint = "",
                info = "",
            })

            --- if you want to know more about lsp-zero and mason.nvim
            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require("mason-lspconfig").setup({
                ensure_installed = { "jdtls" },
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        if server_name ~= "jdtls" then
                            require("lspconfig")[server_name].setup({
                                on_init = function(client)
                                    client.server_capabilities.documentFormattingProvider = false
                                    client.server_capabilities.documentFormattingRangeProvider = false
                                end,
                            })
                        end
                    end,
                },
            })
        end,
    },
    {
        -- DESC: Extensiones para el soporte LSP integrado en Neovim para eclipse.jdt.ls
        "mfussenegger/nvim-jdtls",
        lazy = false,
    },
    {
        -- DESC: Hace que nvim LSP use FZF para mostrar resultados
        "ojroques/nvim-lspfuzzy",
        dependencies = {
            "junegunn/fzf",
            "junegunn/fzf.vim",
        },
        config = function()
            require("lspfuzzy").setup({})
        end,
    },

    -- Diagnosticar
    {
        "piersolenski/wtf.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = {},
        keys = {
            {
                "<leader>wi",
                mode = { "n" },
                function()
                    require("wtf").ai()
                end,
                desc = "wtf.nvim: Debug diagnostic with AI",
            },
            {
                mode = { "n" },
                "<leader>wd",
                function()
                    require("wtf").search()
                end,
                desc = "wtf.nvim: Search diagnostic with Google",
            },
        },
    },

    ---- Navegancion
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
        cmd = { "Navbuddy" },
    },
    --{
    --"folke/trouble.nvim",
    --opts = {}, -- for default options, refer to the configuration section for custom setup.
    --cmd = "Trouble",
    ----keys = {
    ----{
    ----"<leader>xx",
    ----"<cmd>Trouble diagnostics toggle<cr>",
    ----desc = "Diagnostics (Trouble)",
    ----},
    ----{
    ----"<leader>xX",
    ----"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    ----desc = "Buffer Diagnostics (Trouble)",
    ----},
    ----{
    ----"<leader>cs",
    ----"<cmd>Trouble symbols toggle focus=false<cr>",
    ----desc = "Symbols (Trouble)",
    ----},
    ----{
    ----"<leader>cl",
    ----"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    ----desc = "LSP Definitions / references / ... (Trouble)",
    ----},
    ----{
    ----"<leader>xL",
    ----"<cmd>Trouble loclist toggle<cr>",
    ----desc = "Location List (Trouble)",
    ----},
    ----{
    ----"<leader>xQ",
    ----"<cmd>Trouble qflist toggle<cr>",
    ----desc = "Quickfix List (Trouble)",
    ----},
    ----},
    --},
    --{
    ---- DESC: Registra controladores lsp para Telescope
    --"gbrlsnchs/telescope-lsp-handlers.nvim",
    --config = function()
    --require("telescope").load_extension("lsp_handlers")
    --end,
    --keys = {
    --"Telescope",
    --},
    --},
    {
        -- DESC: Vista previa totalmente personalizable para acciones de código LSP.
        "aznhe21/actions-preview.nvim",
        config = function()
            require("actions-preview").setup()
        end,
        keys = {
            {
                mode = "n",
                "<space>tc",
                '<cmd>lua require("actions-preview").code_actions()<cr>',
                desc = "Telescope: code actions",
            },
        },
    },
}
