local current_file = vim.fn.expand("%")
local overseer = require("overseer")

return {
    name = "mdr",
    desc = "MarkDown Renderer",
    builder = function(params)
        return {
            cmd = { "mdr" },
            args = { current_file },
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
