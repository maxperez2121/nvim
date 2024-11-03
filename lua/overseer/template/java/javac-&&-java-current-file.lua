local file_name = vim.fn.expand("%:r")
local overseer = require("overseer")

return {
    name = "javac && java file",
    desc = "Compile and run current file",
    builder = function(params)
        return {
            cmd = { "javac" },
            args = { file_name .. ".java", "&&", "java", file_name },
        }
    end,
    tags = { overseer.TAG.BUILD },
    condition = {
        filetype = { "java" },
    },
}
