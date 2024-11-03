local overseer = require("overseer")

return {
    name = "docker build",
    desc = "Crear imagen docker",
    builder = function(params)
        return {
            cmd = { "docker", "build", "-t", params.image_name .. ":" .. params.tag, "." },
            name = "building docker image",
        }
    end,
    tags = { overseer.TAG.BUILD },
    params = {
        image_name = {
            type = "string",
            desc = "Nombre de la imagen de docker",
            default = "",
            order = 1,
        },
        tag_name = {
            type = "string",
            desc = "Etiqueta de la imagen de docker",
            order = 2,
        },
    },
    condition = {
        filetype = { "dockerfile" },
    },
}
