return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    --python = { "isort", "black" },
                    -- Use a sub-list to run only the first available formatter
                    --javascript = { { "prettierd", "prettier" } },
                },
                format_on_save = {
                    -- These options will be passed to conform.format()
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
            })
        end,
        keys = {
            {
                mode = "n",
                "<leader>fo",
                '<cmd>lua require("conform").format()<cr>',
                desc = "Formatear con conform.nvim",
            },
        },
    },
}
