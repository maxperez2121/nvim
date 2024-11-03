return {
    -- DESC: Machine translation engines without having to leave your editor.
    "potamides/pantran.nvim",
    opts = {
        default_engine = "google",
    },
    cmd = {
        "Pantran",
    },
    keys = {
        --Target es
        { mode = "n", "<leader>ph1", "<cmd>Pantran mode=hover target=es<cr>" },
        { mode = "n", "<leader>pr1", "<cmd>Pantran mode=replace target=es<cr>" },
        { mode = "n", "<leader>pa1", "<cmd>Pantran mode=append target=es<cr>" },
        { mode = "n", "<leader>py1", "<cmd>Pantran mode=yank target=es<cr>" },
        -- Target us
        { mode = "n", "<leader>ph2", "<cmd>Pantran mode=hover target=us<cr>" },
        { mode = "n", "<leader>pr2", "<cmd>Pantran mode=replace target=us<cr>" },
        { mode = "n", "<leader>pa1", "<cmd>Pantran mode=append target=us<cr>" },
        { mode = "n", "<leader>py1", "<cmd>Pantran mode=yank target=us<cr>" },
    },
}
