local overseer = require("overseer")
return {
    name = "maven clean package",
    desc = "Create jar from project",
    tags = { overseer.TAG.BUILD },
    builder = function(params)
        return {
            cmd = { "mvn" },
            args = { "clean", "package" },
            name = "mvn clean package",
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
