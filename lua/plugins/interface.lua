return {
    --{
    --"morhetz/gruvbox",
    --lazy = false,
    --priority = 1,
    --init = function()
    --vim.cmd("colorscheme gruvbox")
    --end,
    --},
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            --vim.o.background = "dark" -- OPTS:
            vim.g.gruvbox_material_background = "soft" -- OPTS: 'hard', 'medium', 'soft'
            vim.g.gruvbox_material_foreground = "original" -- OPTS: 'material', 'mix',`'original`
            --vim.g.gruvbox_material_disable_italic_comment = false
            --vim.g.gruvbox_material_enable_bold = true
            --vim.g.gruvbox_material_enable_italic = true
            --vim.g.gruvbox_material_cursor = "auto" -- OPTS: 'auto', 'red', `orange', 'yellow', 'green', 'aqua', 'blue', 'purple'
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
    {
        -- DESC: Linea de buffers elegante
        "akinsho/bufferline.nvim",
        --enabled = false,
        lazy = false,
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                --options = {
                --mode = "buffers", -- Set to "tabs" mode
                --separator_style = "slant",
                --always_show_bufferline = false,
                --},
            })
        end,
    },
    {
        -- DESC: Gestor de pestañas mejorado.
        "tiagovla/scope.nvim",
        lazy = false,
        config = function()
            require("scope").setup({})
            require("telescope").load_extension("scope")
        end,
    },
    {
        "vim-airline/vim-airline",
        dependencies = {
            "vim-airline/vim-airline-themes",
        },
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.airline_powerline_fonts = 1
            vim.g["airline#extensions#tabline#enabled"] = 0
            --vim.g["airline#extensions#tabline#left_sep"] = " "
            --vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
            --colorscheme gruvbox
            vim.g.airline_theme = "gruvbox_material"
            vim.g.gruvbox_contrast_dark = "soft"
            vim.g.gruvbox_contrast_light = "soft"
            vim.g.gruvbox_transparent_bg = "0"
            --nmap <leader>bd :set background=dark<Enter>
            --nmap <leader>bl :set background=light<Enter>
        end,
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {},
    },
}
