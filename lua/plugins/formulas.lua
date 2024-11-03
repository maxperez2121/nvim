return {
    {
        -- DESC: Tomar notas cientificas en Neovim
        -- REQ:
        -- - colorscheme que soporte treesiter
        -- - Treesiter
        -- - Paquete latex: TSInstall latex
        "jbyuki/nabla.nvim",
        keys = {
            { mode = "n", "<leader>nb", "<cmd>lua require('nabla').popup()<cr>", desc = "Nabla: Formulas cientificas" },
        },
    },
}
