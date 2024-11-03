return {
    {
        -- DESC: plugin that completely replaces the UI for messages, cmdline and the popupmenu.
        "folke/noice.nvim",
        --enabled = false,
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- DESC: UI Component Library for Neovim.
            "MunifTanjim/nui.nvim",
            -- DESC: A fancy, configurable, notification manager for NeoVim
            "rcarriga/nvim-notify",
        },
        config = function()
            --vim.lsp.handlers["textDocument/hover"] = function() end
            --vim.lsp.handlers["textDocument/signatureHelp"] = function() end
            --vim.api.nvim_set_keymap("n", "<leader>nc", "<cmd>Noice dismiss<cr>", {})
            --vim.api.nvim_set_keymap("v", "<leader>nc", "<cmd>Noice dismiss<cr>", {})
            --vim.api.nvim_set_keymap("s", "<leader>nc", "<cmd>Noice dismiss<cr>", {})
            --vim.api.nvim_set_keymap("n", "<leader>nt", "<cmd>Noice telescope<cr>", {})
            --vim.api.nvim_set_keymap("v", "<leader>nt", "<cmd>Noice telescope<cr>", {})
            --vim.api.nvim_set_keymap("s", "<leader>nt", "<cmd>Noice telescope<cr>", {})
            require("noice").setup({
                views = {
                    cmdline_popup = {
                        position = {
                            row = 5,
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = "auto",
                        },
                    },
                    popupmenu = {
                        relative = "editor",
                        position = {
                            row = 8,
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = 10,
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                        },
                    },
                    confirm = {
                        enter = true,
                    },
                }, ---@see section on views
                lsp = {
                    hover = {
                        enabled = false,
                    },
                    signature = {
                        enabled = false,
                    },
                },
            })
        end,
        keys = {
            { mode = { "n", "v", "s" }, "<leader>nc", "<cmd>Noice dismiss<cr>", desc = "Noice: clear notification" },
            { mode = { "n", "v", "s" }, "<leader>nt", "<cmd>Noice telescope<cr>", desc = "Noice: open on telescope" },
        },
    },
}
