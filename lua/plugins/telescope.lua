return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { mode = "n", "<space>tt", "<cmd>Telescope<cr>", desc = "Telescope" },
            { mode = "n", "<space>tf", "<cmd>Telescope find_files<cr>", desc = "Telescope: Buscar archivos" },
            {
                mode = "n",
                "<space>tl",
                "<cmd>Telescope live_grep<cr>",
                desc = "Telescope: Buscar coincidencia en archivos",
            },
            { mode = "n", "<space>tb", "<cmd>Telescope buffers<cr>", desc = "Telescope: Buscar buffers" },
            { mode = "n", "<space>tr", "<cmd>Telescope registres<cr>", desc = "Telescope: Buscar registros" },
        },
    },
    --{
    --"LukasPietzschmann/telescope-tabs",
    --dependencies = { "nvim-telescope/telescope.nvim" },
    --config = function()
    --require("telescope").load_extension("telescope-tabs")
    --require("telescope-tabs").setup({})
    --end,
    --keys = {
    --{ mode = "n", "<space>tt", "<cmd>Telescope telescope-tabs list_tabs<cr>", desc = "Telescope tabs" },
    --},
    --},
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
        config = function()
            local project_actions = require("telescope._extensions.project.actions")
            require("telescope").setup({
                extensions = {
                    project = {
                        base_dirs = {
                            { path = "~/proyectos/", max_depth = 2 },
                            { path = "~/NetBeansProjects/", max_depth = 2 },
                        },
                        hidden_files = true, -- default: false
                        --theme = "dropdown",
                        order_by = "asc",
                        search_by = "title",
                        sync_with_nvim_tree = true, -- default false
                        -- default for on_project_selected = find project files
                        --on_project_selected = function(prompt_bufnr)
                        ---- Do anything you want in here. For example:
                        --project_actions.change_working_directory(prompt_bufnr, false)
                        --require("harpoon.ui").nav_file(1)
                        --end,
                    },
                },
            })
        end,
        keys = {
            {
                mode = "n",
                "<space>tp",
                "<cmd>lua require'telescope'.extensions.project.project{}<cr>",
                desc = "Telescope projects",
            },
        },
    },
}
