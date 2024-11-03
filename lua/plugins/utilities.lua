return {
    {
        -- DESC: Visualizar el árbol de deshacer de vim.
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = {
            { mode = "n", "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Abrir/Cerrar arbol de deshacer" },
        },
    },
    {
        -- DESC: Comandos de shell de UNIX (como SudoWrite, Chmod).
        "tpope/vim-eunuch",
        cmd = {
            "Remove",
            "Delete",
            "Move",
            "Chmod",
            "Mkdir",
            "Cfind",
            "Clocate",
            "Lfind",
            "Llocate",
            "Wall",
            "SudoWrite",
            "SudoEdit",
            "Rename",
        },
    },
    {
        -- DESC: Things you can do with fzf and Vim.
        "junegunn/fzf",
        dependencies = {
            "junegunn/fzf.vim",
        },
        build = function()
            vim.fn["fzf#install"]()
        end,
        cmd = {
            "Files",
            "GFiles",
            "Buffers",
            "Colors",
            "Ag",
            "Rg",
            "RG",
            "Lines",
            "BLines",
            "Tags",
            "BTags",
            "Marks",
            "Jumps",
            "Windows",
            "Locate",
            "History",
            "Snippets",
            "Commits",
            "BCommits",
            "Commands",
            "Maps",
            "Helptags",
            "Filetypes",
        },
    },
    {
        -- DESC: This is a Neovim plugin that helps you pick Nerd Font Icons, Symbols & Emojis
        "ziontee113/icon-picker.nvim",
        --config = function()
        --require("icon-picker").setup({
        --disable_legacy_commands = false,
        --})
        --end,
        opts = {
            disable_legacy_commands = false,
        },
        keys = {
            { mode = "n", "<leader>ipn", "<cmd>IconPickerNormal<cr>" },
            { mode = "i", "<leader>ipi", "<cmd>IconPickerInsert<cr>" },
        },
    },
    --{
    --    -- DESC: Open URI with your favorite browser from your most favorite editor
    --    "tyru/open-browser.vim",
    --},
    {
        -- DESC: This plugin provides basic support for .env and Procfile.
        "tpope/vim-dotenv",
        ft = {
            "env",
        },
    },
    --{   -- TEST: try this plugin (grammar_guard)
    --    -- FIX: At the moment, the config lauch error
    --    -- DESC: Grammar Guard checks your grammar as you write (LaTeX, Markdown or plain text)
    --    "brymer-meneses/grammar-guard.nvim",
    --    requires = {
    --        "neovim/nvim-lspconfig",
    --        "williamboman/nvim-lsp-installer"
    --    },
    --    config = function()
    --        require("lspconfig").grammar_guard.setup({
    --            --cmd = { '/path/to/ltex-ls' }, -- add this if you install ltex-ls yourself
    --        	settings = {
    --        		ltex = {
    --        			enabled = { "latex", "tex", "bib", "markdown" },
    --        			--language = "en",
    --        			language = "es",
    --        			diagnosticSeverity = "information",
    --        			setenceCacheSize = 2000,
    --        			additionalRules = {
    --        				enablePickyRules = true,
    --        				motherTongue = "en",
    --        			},
    --        			trace = { server = "verbose" },
    --        			dictionary = {},
    --        			disabledRules = {},
    --        			hiddenFalsePositives = {},
    --        		},
    --        	},
    --        })
    --    end,
    --    cmd = {
    --        "GrammarInstall",
    --    },
    --    ft = {
    --        "latex",
    --        "tex",
    --        "bib",
    --        "markdown",
    --    },
    --},
    {
        -- FAILED: tried this plugin
        -- DESC: A powerful grammar checker for Vim using LanguageTool.
        -- WARN: if we have the message "language Tool doesn`t found on ~/config/nvim" and
        -- freezed screen. Wait a time becouse the jar file is downloading.
        "rhysd/vim-grammarous", --
        event = "VeryLazy",
        init = function()
            vim.g.grammarous_default_comments_only_filetypes = {
                ["*"] = 1,
                help = 0,
                markdown = 0,
            }
            vim.g.grammarous_check_comments = 1
        end,
        --ft = {
        --    "markdown",
        --},
    },
    {
        "ibhagwan/fzf-lua",
        --lazy = false,
        --priority = 100,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { mode = "n", "<leader>fa", "<cmd>FzfLua lsp_code_actions<cr>", desc = "FzfLua: Lsp Code Actions" },
            {
                mode = "n",
                "<leader>fd",
                "<cmd>FzfLua lsp_document_diagnostics<cr>",
                desc = "FzfLua: Lsp document diagnostic",
            },
            {
                mode = "n",
                "<leader>fw",
                "<cmd>FzfLua lsp_workspace_diagnostics<cr>",
                desc = "FzfLua: Lsp workspace diagnostics",
            },
        },
    },
}
