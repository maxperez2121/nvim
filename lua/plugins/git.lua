return {
    {
        -- DESC: A Git wrapper so awesome.
        -- WARN: Require project git was inited
        -- sdf
        "tpope/vim-fugitive",
        cmd = {
            "Git",
            "Gedit",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
        },
    },
    {
        -- DESC: A Vim plugin which shows git diff markers in the sign column.
        -- WARN: Require project git was inited
        "airblade/vim-gitgutter",
        cmd = {
            "GitGutterToggle",
            "GitGutterBufferToggle",
            "GitGutterSignsToggle",
            "GitGutterLineHighlightsToggle",
        },
    },
    {
        -- DESC: A fast, beautiful, and powerful git branch viewer for vim.
        "rbong/vim-flog",
        dependencies = {
            -- DESC: A Git wrapper so awesome.
            "tpope/vim-fugitive",
            -- Extension`s
            -- DESC: Automatically update flog windows
            {
                "TamaMcGlinn/vim-autoflog",
                build = "pip3 install pyinotify",
                -- NOTE: To launch Flog use "call autoflog#open_flog()"
            },
        },
        cmd = {
            "Flog",
            "Floggit",
            "Flogsplit",
        },
    },
    {
        -- FIX: This plugin doesn`t work correctly
        -- DESC: vim quickui menu for fugitive and flog commands
        "TamaMcGlinn/flog-menu",
        dependencies = {
            -- DESC: A Git wrapper so awesome.
            "tpope/vim-fugitive",
            -- DESC: A fast, beautiful, and powerful git branch viewer for vim.
            "rbong/vim-flog",
            -- DESC: The missing UI extensions for Vim 8.2 (and NeoVim 0.4)
            "skywind3000/vim-quickui",
            --"TamaMcGlinn/flog-menu",
            --Extension`s
            --"TamaMcGlinn/flog-teamjump",
        },
        keys = {
            --{"<Space>gm", "<cmd>call flogmenu#open_all_windows()<CR>"},
            { "<Space>gm", "<cmd>call flogmenu#open_main_contextmenu()<CR>" },
        },
    },
    {
        -- FIX: This plugin doesn`t work: error message
        -- DESC: Single tabpage interface for cycling through diffs for all modified files.
        -- WARN: For Mercurial support need: Mercurial >= 5.4.0
        "sindrets/diffview.nvim",
        enabled = false,
        dependencies = {
            -- DESC: lua `fork` of vim-web-devicons for neovim
            "nvim-tree/nvim-web-devicons",
        },
        cmd = {
            "DiffviewOpen",
        },
    },
    {
        -- DESC: Search your git history by commit message, content and author in Neovim.
        --       Extension for Telescope and fzf-lua
        "aaronhallaert/advanced-git-search.nvim",
        dependencies = {
            -- DESC: A Git wrapper so awesome.
            "tpope/vim-fugitive",
            -- DESC: Find, Filter, Preview, Pick. All lua, all the time.
            "nvim-telescope/telescope.nvim",
            -- DESC: Single tabpage interface for cycling through diffs for all modified files.
            "sindrets/diffview.nvim",
        },
        config = function()
            require("telescope").setup({
                -- NOTE: move this to the place where you call the telescope setup function
                extensions = {
                    advanced_git_search = {
                        -- NOTE: Can be fugitive or diffview
                        diff_plugin = "diffview",
                        ---- NOTE: customize git in previewer
                        ----       e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
                        --git_flags = {},
                        ---- NOTE: customize git diff in previewer
                        ----       e.g. flags such as { "--raw" }
                        --git_diff_flags = {},
                        ---- NOTE: Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
                        --show_builtin_git_pickers = false,
                    },
                },
            })
            require("telescope").load_extension("advanced_git_search")
            --require('telescope').extensions.advanced_git_search()
        end,
        cmd = {
            "AdvancedGitSearch",
        },
        keys = {
            { "<Space>gs", "<cmd>AdvancedGitSearch<cr>" },
        },
    },
    {
        -- DESC: Vim plugin for managing git remotes
        "TamaMcGlinn/vim-gitremotes",
        dependencies = {
            -- DESC: A Git wrapper so awesome.
            "tpope/vim-fugitive",
            -- DESC: Things you can do with fzf and Vim.
            "junegunn/fzf",
        },
        cmd = {
            "GRemoteList",
            "GRemoteAdd",
            "GRemoteEdit",
        },
    },
    {
        -- DESC: Git branch management for Vim
        "TamaMcGlinn/vim-twiggy",
        dependencies = {
            -- DESC: A Git wrapper so awesome.
            "tpope/vim-fugitive",
        },
        cmd = {
            "Twiggy",
        },
    },
    -- GitHub
    {
        -- DESC: Browse GitHub events in Vim
        "junegunn/vim-github-dashboard",
        cmd = {
            "GHA",
            "GHDashboard",
            "GHActivity",
        },
    },
}
