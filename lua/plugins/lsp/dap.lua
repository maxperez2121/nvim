return {
    {
        "ldelossa/nvim-dap-projects",
        keys = {
            {
                mode = "n",
                "<leader>dpr",
                "<cmd>lua require('nvim-dap-projects').search_project_config()<cr>",
                desc = "dap-project: DapContinue por proyecto",
            },
            {
                mode = "n",
                "<leader>dpp",
                ":lua require('nvim-dap-projects').config_paths = {'./",
                desc = "dap-project: Proporcionar archivo especifico",
            },
        },
    },
    -- TODO: Revisar los siguientes enlaces de configuracion de nvim-dap
    -- https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/dap.lua
    -- https://github.com/mfussenegger/nvim-dap/wiki/JAVA_HOME
    -- https://github.com/mfussenegger/nvim-jdtls
    -- https://github.com/mfussenegger/nvim-jdtls/wiki/Sample-Configurations
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("mason").setup()
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" },
            })
        end,
        cmd = {
            "DapInstall",
            "DapUninstall",
        },
    },
    {
        "nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            --"ChristianChiarulli/neovim-codicons",
        },
        config = function()
            require("dapui").setup({
                controls = {
                    element = "repl",
                    enabled = true,
                    icons = {
                        disconnect = "",
                        pause = "",
                        play = "",
                        run_last = "勒",
                        step_back = "",
                        step_into = "",
                        step_out = "",
                        step_over = "",
                        terminate = "□",
                    },
                },
                element_mappings = {},
                expand_lines = true,
                floating = {
                    border = "single",
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                force_buffers = true,
                icons = {
                    collapsed = "",
                    current_frame = "⋆",
                    expanded = "",
                },
                layouts = {
                    {
                        elements = {
                            {
                                id = "scopes",
                                size = 0.25,
                            },
                            {
                                id = "breakpoints",
                                size = 0.25,
                            },
                            {
                                id = "stacks",
                                size = 0.25,
                            },
                            {
                                id = "watches",
                                size = 0.25,
                            },
                        },
                        position = "left",
                        size = 40,
                    },
                    {
                        elements = {
                            {
                                id = "repl",
                                size = 0.5,
                            },
                            {
                                id = "console",
                                size = 0.5,
                            },
                        },
                        position = "bottom",
                        size = 10,
                    },
                },
                mappings = {
                    edit = "e",
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    repl = "r",
                    toggle = "t",
                },
                render = {
                    indent = 1,
                    max_value_lines = 100,
                },
            })
        end,
        keys = {
            { mode = "n", "<leader>du", '<cmd>lua require("dapui").toggle()<cr>', desc = "Open/Close DAPUI" },
        },
    },
    {
        -- DESC: Corredor de código/configurador de proyectos extensible.
        -- Administre tareas, bases de datos, pruebas y configuraciones de depuración
        "kndndrj/nvim-projector",
        dependencies = {
            -- required:
            "MunifTanjim/nui.nvim",
            -- optional extensions:
            "kndndrj/projector-neotest",
            -- dependencies of extensions:
            "nvim-neotest/neotest",
        },
        config = function()
            require("projector").setup(--[[optional config]])
        end,
    },
    {
        -- DESC: Integración para nvim-dap con telescope.nvim
        "nvim-telescope/telescope-dap.nvim",
        config = function()
            require("telescope").load_extension("dap")
        end,
        cmd = {
            "Telescope dap",
        },
    },
}
