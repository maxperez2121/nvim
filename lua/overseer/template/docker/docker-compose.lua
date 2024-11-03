local overseer = require("overseer")
function overseerDockerComposeConfirmBackground()
    local respuesta = vim.fn.confirm("¿Iniciar en segundo plano?", "&Sí\n&No", 1)
    if respuesta == 1 then
        return "up -d"
    else
        return "up"
    end
end
return {
    name = "docker-compose",
    desc = "Levantar contendores docker desde yaml",
    builder = function(params)
        -- This must return an overseer.TaskDefinition
        return {
            -- cmd is the only required field
            cmd = { "docker-compose" },
            -- additional arguments for the cmd
            args = { overseerDockerComposeConfirmBackground() },
            -- the name of the task (defaults to the cmd of the task)
            name = "up docker compose",
        }
    end,
    tags = { overseer.TAG.RUN },
    params = {
        on_background = {
            type = "boolean",
            desc = "Up contaniers on background",
            default = true,
        },
    },
    condition = {
        callback = function()
            local function file_exists(file)
                local stat = vim.loop.fs_stat(file)
                return stat and stat.type == "file"
            end

            if file_exists("docker-compose.yaml") then
                return true
            end
        end,
    },
}
