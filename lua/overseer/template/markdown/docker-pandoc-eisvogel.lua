local overseer = require("overseer")
local cwd = vim.fn.getcwd()
local relative_path = vim.fn.expand("%:h")
local fileName = vim.fn.expand("%:t:r")

return {
    name = "render to pdf",
    desc = "docker pandoc and eisvogel",
    builder = function(params)
        return {
            cmd = {
                "docker",
            },
            args = {
                "run",
                "--rm",
                "-v",
                cwd .. ":/data",
                --"-u",
                --"1000:1000",
                "pandoc/extra",
                relative_path .. "/" .. fileName .. ".md",
                "-o",
                relative_path .. "/" .. fileName .. ".pdf",
                "--from",
                "markdown",
                "--template",
                "eisvogel",
                "--listings",
            },
            --strategy = {
            --"toggleterm",
            --use_shell = true,
            --direction = "horizontal",
            --open_on_start = true,
            --size = 20,
            --},
        }
    end,
    tags = { overseer.TAG.BUILD },
    condition = {
        filetype = { "markdown" },
    },
}
