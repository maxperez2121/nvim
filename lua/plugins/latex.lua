return {
    {
        -- DESC: A modern Vim and neovim filetype plugin for LaTeX files  and syntax plugin for LaTeX files.
        "lervag/vimtex",
        config = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_view_general_viewer = "okular"
            --vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
        end,
        ft = {
            "tex",
            "latex",
        },
    },
    {
        "xuhdev/vim-latex-live-preview",
        config = function()
            vim.g.livepreview_previewer = "zathura"
            vim.g.livepreview_engine = "xelatex"
            --vim.g.livepreview_engine = 'your_engine' . ' [options]'
        end,
        ft = {
            "tex",
            "latex",
        },
    },
}
