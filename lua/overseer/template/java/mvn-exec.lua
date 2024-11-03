local overseer = require("overseer")
return {
    name = "maven run project",
    desc = "Run current project",
    tags = { overseer.TAG.BUILD },
    builder = function(params)
        return {
            cmd = { "mvn" },
            args = { "exec:java" },
            name = "mvn exec:java",
            cwd = os.getenv("PWD"),
        }
    end,
    condition = {
        callback = function()
            local function file_exists(file)
                local stat = vim.loop.fs_stat(file)
                return stat and stat.type == "file"
            end

            if not file_exists("mvnw.cmd") then
                if file_exists("pom.xml") then
                    return true
                end
            end
        end,
    },
}
