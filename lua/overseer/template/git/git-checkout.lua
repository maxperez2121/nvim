return {
    name = "Git checkout",
    params = function()
        local stdout = vim.system({ "git", "branch", "--format=%(refname:short)" }):wait().stdout
        local branches = vim.split(stdout, "\n", { trimempty = true })
        return {
            branch = {
                desc = "Branch to checkout",
                type = "enum",
                choices = branches,
            },
        }
    end,
    builder = function(params)
        return {
            cmd = { "git", "checkout", params.branch },
        }
    end,
    condition = {
        callback = function()
            function check_folder_exist(folder_name)
                local current_dir = vim.fn.getcwd()
                local folder_path = current_dir .. "/" .. folder_name
                local exists = vim.fn.isdirectory(folder_path)

                if exists == 1 then
                    return true
                end
            end
            return check_folder_exist(".git")
        end,
    },
}
