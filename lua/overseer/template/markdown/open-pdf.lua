local overseer = require("overseer")
local cwd = vim.fn.getcwd()
local relative_path = vim.fn.expand("%:h")
local fileName = vim.fn.expand("%:t:r")

return {
    name = "open pdf generated",
    desc = "",
    builder = function(params)
        return {
            cmd = {
                "okular",
            },
            args = {
                relative_path .. "/" .. fileName .. ".pdf",
            },
        }
    end,
    tags = { overseer.TAG.BUILD },
    params = {
        -- See :help overseer-params
    },
    condition = {
        filetype = { "markdown" },
    },
}
