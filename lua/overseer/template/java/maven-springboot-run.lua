local overseer = require("overseer")
return {
    name = "Maven - spring-boot:run",
    desc = "Run spring-boot project",
    tags = { overseer.TAG.RUN },
    builder = function(params)
        return {
            cmd = { "./mvnw" },
            args = { "spring-boot:run" },
            name = "spring-boot:run",
            cwd = os.getenv("PWD"),
        }
    end,
    condition = {
        callback = function()
            local function file_exists(file)
                local stat = vim.loop.fs_stat(file)
                return stat and stat.type == "file"
            end

            if file_exists("mvnw.cmd") then
                return true
            end
        end,
    },
}
