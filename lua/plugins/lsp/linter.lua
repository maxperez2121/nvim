return {
    {
        "rshkarin/mason-nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-lint",
        },
        config = function()
            require("mason-nvim-lint").setup({
                quiet_mode = false,
            })
        end,
    },
}
