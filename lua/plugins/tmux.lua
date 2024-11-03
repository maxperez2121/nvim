return {
    {
        -- DESC: Make terminal vim and tmux work better together.
        "tmux-plugins/vim-tmux-focus-events",
        event = "VeryLazy",
    },
    {
        -- DESC: Automatically copy yanked text into tmux's clipboard, and copy tmux's clipboard
        --       content into vim's quote(") register, known as the unnamed register.
        "roxma/vim-tmux-clipboard",
        event = "VeryLazy",
        dependencies = {
            -- DESC: Make terminal vim and tmux work better together.
            "tmux-plugins/vim-tmux-focus-events",
        }
    },
}
