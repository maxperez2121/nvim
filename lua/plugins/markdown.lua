return {
    {
        "kiran94/edit-markdown-table.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = true,
        ft = { "markdown" },
    },
    {
        "mzlogin/vim-markdown-toc",
        ft = { "markdown" },
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && yarn install",
        ft = {
            "md",
            "markdown",
        },
        config = function()
            vim.g.mkdp_refresh_slow = 1
            vim.g.mkdp_browser = "qutebrowser"
            vim.g.mkdp_theme = "dark"
            --vim.g.mkdp_markdown_css = "/home/humberto/.config/nvim/gruvbox-dark-medium.css"
            --vim.g.mkdp_markdown_css = "~/.config/nvim/gruvbox-dark-medium.css"
        end,
        cmd = {
            "MarkdownPreviewToggle",
        },
    },
    {
        "Zeioth/markmap.nvim",
        build = "yarn global add markmap-cli",
        opts = {
            html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
            hide_toolbar = false, -- (default)
            grace_period = 3600000, -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
        },
        config = function(_, opts)
            require("markmap").setup(opts)
        end,
        ft = { "markdown" },
        --cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
    },
    {
        "yaocccc/nvim-hl-mdcodeblock.lua",
        enabled = false,
        config = function()
            require("hl-mdcodeblock").setup({
                -- option
                -- hl_group = "MDCodeBlock",   -- default highlight group
                events = { -- refresh event
                    "FileChangedShellPost",
                    "Syntax",
                    "TextChanged",
                    "TextChangedI",
                    "InsertLeave",
                    "WinScrolled",
                    "BufEnter",
                },
                padding_right = 4, -- always append 4 space at lineend
                timer_delay = 20, -- refresh delay(ms)
                query_by_ft = { -- special parser query by filetype
                    markdown = { -- filetype
                        "markdown", -- parser
                        "(fenced_code_block) @codeblock", -- query
                    },
                    rmd = { -- filetype
                        "markdown", -- parser
                        "(fenced_code_block) @codeblock", -- query
                    },
                },
                minumum_len = 100, -- minimum len to highlight (number | function)
                -- minumum_len = function () return math.max(math.floor(vim.api.nvim_win_get_width(0) * 0.8), 100) end
            })
        end,
    },
}
