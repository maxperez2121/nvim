return {
    --{
    --"preservim/nerdtree",
    --dependencies = {
    --"ryanoasis/vim-devicons",
    --"PhilRunninger/nerdtree-visual-selection",
    --"Xuyuanp/nerdtree-git-plugin",
    --"tiagofumo/vim-nerdtree-syntax-highlight",
    --},
    --config = function() end,
    --keys = {
    --{ mode = "n", "<space>ntt", "<cmd>NERDTreeToggle<cr>", desc = "Abrir/Cerrar NerdTreee" },
    --{ mode = "n", "<space>ntf", "<cmd>NERDTreeFind<cr>", desc = "Abrir/Cerrar NerdTreee" },
    --},
    --},
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup()
        end,
        keys = {
            { mode = "n", "<space>ntt", "<cmd>NvimTreeToggle<cr>", desc = "Open/Close nvim-tree explorer" },
            { mode = "n", "<space>ntf", "<cmd>NvimTreeFindFile<cr>", desc = "Open/Close nvim-tree explorer" },
            --{ mode = "n", "<space>ntt", "<cmd>NvimTreeToggle<cr>", desc = "Open/Close nvim-tree explorer" },
        },
    },
    {
        "vifm/vifm.vim",
        lazy = false,
        cmd = {
            "EditVifm",
            "Vifm",
            "PeditVifm",
            "SplitVifm",
            "VsplitVifm",
            "DiffVifm",
            "TabVifm",
            "VifmCs",
        },
        keys = {
            { mode = "n", "<space>vf", "<cmd>Vifm<cr>", desc = "Vifm: Abrir explorador de archivos" },
        },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                extensions = {
                    file_browser = {
                        theme = "ivy",
                        -- disables netrw and use telescope-file-browser in its place
                        --hijack_netrw = true,
                    },
                },
            })
            require("telescope").load_extension("file_browser")
        end,
        keys = {
            { mode = "n", "<space>fs", "<cmd>Telescope file_browser<cr>", desc = "Telescope: file browser" },
            {
                mode = "n",
                "<space>fp",
                "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
                desc = "Telescope: file browser of current buffer",
            },
        },
    },
    {
        -- REQ:
        -- - Chafa (required for image support)
        -- - ImageMagick (optional, for svg previews)
        -- - fd / rg / find or fdfind in Ubuntu/Debian.
        -- - ffmpegthumbnailer (optional, for video preview support)
        -- - pdftoppm (optional, for pdf preview support. Available in the AUR as poppler package.)
        -- - epub-thumbnailer (optional, for epub preview support.)
        -- - fontpreview (optional, for font preview support)
        "nvim-telescope/telescope-media-files.nvim",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    media_files = {
                        filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
                        find_cmd = "fdfind", -- you can also use "rg" or "find"
                    },
                },
            })

            require("telescope").load_extension("media_files")
        end,
        keys = {
            { mode = "n", "<space>tm", "<cmd>Telescope media_files<cr>", desc = "Telescope: Preview media files" },
        },
    },
}
