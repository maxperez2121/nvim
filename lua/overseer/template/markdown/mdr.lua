local current_file = vim.fn.expand("%")
local overseer = require("overseer")

return {
    name = "mdr",
    desc = "MarkDown Renderer",
    builder = function(params)
        return {
            cmd = { "mdr" },
            args = { current_file },
            strategy = {
                "toggleterm",
                direction = "vertical",
                open_on_start = true,
            },
        }
    end,
    tags = { overseer.TAG.BUILD },
    condition = {
        filetype = { "markdown" },
    },
}
