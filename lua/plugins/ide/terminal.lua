return {
    {
        "voldikss/vim-floaterm",
        keys = {
            {
                mode = "n",
                "<space>tr",
                "<cmd>FloatermNew --height=0.8 --width=0.8 --wintype=float<cr>",
                desc = "Floaterm: Abrir terminal flotante",
            },
        },
    },
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        version = "*",
        config = true,
    },
}
