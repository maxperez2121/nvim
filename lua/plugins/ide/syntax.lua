return {
    {
        "sheerun/vim-polyglot",
    },
    {
        "anuvyklack/fold-preview.nvim",
        enabled = false,
        dependencies = {
            "anuvyklack/keymap-amend.nvim",
        },
        config = function()
            require("fold-preview").setup({
                -- Your configuration goes here.
                default_keybindings = false,
                border = "rounded",
            })
        end,
        keys = {
            { mode = "n", "h", "<cmd>lua require('fold-preview').mapping.show_close_preview_open_fold", desc = "" },
            { mode = "n", "l", "<cmd>lua require('fold-preview').mapping.close_preview_open_fold", desc = "" },
            { mode = "n", "zo", "<cmd>lua require('fold-preview').mapping.close_preview", desc = "" },
            { mode = "n", "zO", "<cmd>lua require('fold-preview').mapping.close_preview", desc = "" },
            { mode = "n", "zc", "<cmd>lua require('fold-preview').mapping.close_preview_without_defer", desc = "" },
            { mode = "n", "zR", "<cmd>lua require('fold-preview').mapping.close_preview", desc = "" },
            { mode = "n", "zM", "<cmd>lua require('fold-preview').mapping.close_preview_without_defer", desc = "" },
        },
    },
    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {
            keys = "etovxqpdygfblzhckisuran",
        },
        keys = {
            { mode = "n", "<space>hww", "<cmd>HopWord<cr>", desc = "" },
            { mode = "n", "<space>hwp", "<cmd>HopPattern<cr>", desc = "" },
            { mode = "n", "<space>hwn", "<cmd>HopNodes<cr>", desc = "" },
        },
    },
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        branch = "v0.6", --recommended as each new version will have breaking changes
        opts = {
            --Config goes here
        },
    },
    {
        "vim-closetag",
        ft = {
            "html",
            "xhtml",
            "phtml",
            "jsx",
        },
        config = function()
            vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml"
            vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx"
            vim.g.closetag_filetypes = "html,xhtml,phtml"
            vim.g.closetag_xhtml_filetypes = "xhtml,jsx"
            vim.g.closetag_emptyTags_caseSensitive = 1
            vim.g.closetag_regions = {
                ["typescript.tsx"] = "jsxRegion,tsxRegion",
                ["javascript.jsx"] = "jsxRegion",
                ["typescriptreact"] = "jsxRegion,tsxRegion",
                ["javascriptreact"] = "jsxRegion",
            }
            vim.g.closetag_shortcut = ">"
            vim.g.closetag_close_shortcut = "<leader>>"
        end,
    },
    {
        "mg979/vim-visual-multi",
        --lazy = false,
        branch = "master",
        keys = { "<C-n>" },
    },
    {
        "s1n7ax/nvim-search-and-replace",
        config = function()
            require("nvim-search-and-replace").setup()
        end,
        cmd = {
            "SReplace",
            "SReplaceAll",
            "SReplaceAndSave",
            "SReplaceAllAndSave",
        },
        keys = {
            "<leader>gr",
            "<leader>gR",
            "<leader>gu",
            "<leader>gU",
        },
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
    {
        -- DESC: Plugin para alinear
        "junegunn/vim-easy-align",
        event = "VeryLazy",
        keys = {
            { mode = "n", "<leader>ga", "<Plug>(EasyAlign)", desc = "EasyAlign: for normal mode" },
            { mode = "x", "<leader>ga", "<Plug>(EasyAlign)", desc = "EasyAlign: for visual mode" },
        },
    },
}
