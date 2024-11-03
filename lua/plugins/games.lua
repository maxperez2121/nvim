return {
    {
        -- DESC: Classic Black Jack game in Neovim
        "alanfortlink/blackjack.nvim",
        dependencies = {
            -- DESC: All the lua functions I don't want to write twice.
            'nvim-lua/plenary.nvim',
        },
        config = function()
            local scores_path = os.getenv("HOME") .. "/blackjack_scores.json"

            require("blackjack").setup({
                card_style = "mini", -- NOTE: Can be "mini" or "large".
                suit_style = "black", -- NOTE: Can be "black" or "white".
                scores_path = scores_path, -- NOTE: Default location to store the scores.json file.
            })
        end,
        cmd = {
            "BlackJackNewGame"
        },
    },
    {
        -- DESC: Sudoku game on Neovim
        'jim-fx/sudoku.nvim',
        cmd = "Sudoku",
        config = function()
            require("sudoku").setup()
        end,
    },
}
