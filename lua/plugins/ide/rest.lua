return {
    {
        "rest-nvim/rest.nvim",
        enabled = false,
        dependencies = { "luarocks.nvim" },
        config = function()
            require("rest-nvim").setup()
        end,
        --ft = "http",
    },
    {
        "diepm/vim-rest-console",
        ft = {
            "rest",
        },
        config = true,
    },
    {
        -- DESC: Una interfaz mínima de cliente HTTP para Neovim. Kulala en swahili significa "descansar" o "relajarse".
        "mistweaverco/kulala.nvim",
        --dependencies = {
        --"anuvyklack/hydra.nvim",
        --},
        ft = {
            "http",
        },
        config = function()
            require("kulala").setup({
                default_view = "body", -- OPTS: "body", "headers"
                -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
                default_env = "dev", -- OPTS: "dev", "test", "prod"
                debug = false,
                --formatters = {
                --json = { "jq", "." },
                --xml = { "xmllint", "--format", "-" },
                --html = { "xmllint", "--format", "--html", "-" },
                --},
                icons = {
                    inlay = {
                        loading = "⏳",
                        done = "✅",
                    },
                    lualine = "🐼",
                },
                -- additional cURL options
                -- e.g. { "--insecure", "-A", "Mozilla/5.0" }
                additional_curl_options = {},
            })
        end,
    },
}
