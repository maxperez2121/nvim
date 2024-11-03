return {
    {
        -- DESC: Draw ASCII diagrams in Neovim
        "jbyuki/venn.nvim",
        dependencies = {
            "anuvyklack/hydra.nvim",
        },
        config = function()
            -- NOTE: cant use tabs or Space`s because this show in menu
            local hint = [[
 Arrow^^^^^^   Select region with <C-v> 
 ^ ^ _K_ ^ ^   _f_: surround it with box
 _H_ ^ ^ _L_
 ^ ^ _J_ ^ ^                      _<Esc>_
]]
            local Hydra = require("hydra")
            Hydra({
                name = "Draw Diagram",
                hint = hint,
                config = {
                    color = "pink",
                    invoke_on_body = true,
                    hint = {
                        type = "window", -- OPTS: "window", "cmdline", "statusline", "statuslinemanual"
                        position = "bottom",
                        offset = 1,
                        show_name = true,

                        -- options passed to `nvim_open_win()`, see :h nvim_open_win()
                        -- Lets you set border, header, footer, etc etc.
                        float_opts = {
                            -- row, col, height, width, relative, and anchor should not be
                            -- overridden
                            --style = "minimal",
                            --focusable = false,
                            --noautocmd = true,
                            border = "rounded",
                        },
                    },
                    on_enter = function()
                        vim.o.virtualedit = "all"
                    end,
                },
                mode = "n",
                body = "<leader>md",
                heads = {
                    { "H", "<C-v>h:VBox<CR>" },
                    { "J", "<C-v>j:VBox<CR>" },
                    { "K", "<C-v>k:VBox<CR>" },
                    { "L", "<C-v>l:VBox<CR>" },
                    { "f", ":VBox<CR>", { mode = "v" } },
                    { "<Esc>", nil, { exit = true } },
                },
            })
        end,
        keys = {
            { "<leader>md", mode = "n", desc = "SubMode for drawing diagrams" },
        },
    },
}
