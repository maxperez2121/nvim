return {
    {
        "scrooloose/nerdcommenter",
        lazy = false,
        config = function()
            vim.g.NERDCreateDefaultMappings = 0
            vim.api.nvim_set_keymap("v", "<leader>ncc", "<cmd>NERDCommenterComment<cr>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<leader>nct", "<cmd>NERDCommenterToggle<cr>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<leader>ncu", "<cmd>NERDCommenterUncomment<cr>", { noremap = true })
        end,
        --cmd = {
        --    'NERDCommenterComment',
        --    'NERDCommenterToggle',
        --    'NERDCommenterSexy',
        --    'NERDCommenterSexy',
        --},
        --keys = {
        --    { "<leader>ncc", "<cmd>NERDCommenterComment<cr>", desc = "" },
        --    { "<leader>nct", "<cmd>NERDCommenterToggle<cr>", desc = "" },
        --    { "<leader>ncu", "<cmd>NERDCommenterUncomment<cr>", desc = "" },
        --},
    },
    {
        -- TODO:
        -- WARN:
        -- FIX:
        -- NOTE:
        -- DESC:
        -- TEST:
        -- OPTS:
        "folke/todo-comments.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = true,
            keywords = {
                FIX = { icon = "", color = "#CC241D", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = "", color = "#458588", alt = { "DOING" } },
                WARN = { icon = "", color = "#FE8019", alt = { "WARNING" } },
                TEST = { icon = "⏲", color = "#B8BB26", alt = { "TESTING", "PASSED", "FAILED" } },
                NOTE = { icon = "", color = "#689D6A", alt = { "INFO" } },
                DESC = { icon = "", color = "#BDAE93", alt = { "DESCRIPTION" } },
                OPTS = { icon = "", color = "#83A598", alt = { "OPTIONS" } },
                REQ = { icon = "", color = "#FE8019", alt = { "REQUIREMENTS" } },
            },
        },
        keys = {
            { mode = "n", "<leader>to", "<cmd>TodoTelescope", desc = "Telescope: Todo comments" },
        },
    },
}
