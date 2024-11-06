return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "lua", "javascript", "html" },
                sync_install = false, -- DESC: Instalar analizadores sincrónicamente (solo se aplica a `ensure_installed`)
                auto_install = true, -- DESC: Instalar automáticamente los analizadores que faltan al ingresar al búfer
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false,
        config = function()
            require("treesitter-context").setup({
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            })
        end,
        keys = {
            {
                mode = "n",
                "<space>tgc",
                '<cmd>lua require("treesitter-context").go_to_context(vim.v.count1)<cr>',
                desc = "Treesitter: Saltar al contexto",
            },
        },
    },
    {
        "Wansmer/treesj",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
        config = function()
            require("treesj").setup({
                use_default_keymaps = false,
            })
        end,
        keys = {
            { mode = "n", "<leader>tsj", "<cmd>lua require('treesj').toggle()<cr>", desc = "Treesj: Split/Join code" },
        },
    },
}
