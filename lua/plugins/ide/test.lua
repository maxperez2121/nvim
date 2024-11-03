return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- DESC: Adaptadores
            "rcasia/neotest-java", -- DESC: Test using JUnit
        },
        opts = {
            adapters = {
                ["neotest-java"] = {
                    ignore_wrapper = false, -- DESC: Si se debe ignorar el contenedor maven/gradle
                    junit_jar = nil,
                    -- default: .local/share/nvim/neotest-java/junit-platform-console-standalone-[version].jar
                },
                --require("neotest-java"),
                --["neotest-python"] = {
                --dap = { justMyCode = false },
                --},
                --["neotest-plenary"] = {},
                --["neotest-vim-test"] = {
                --ignore_file_types = { "python", "vim", "lua" },
                --},
            },
        },
        keys = {
            {
                mode = "n",
                "<leader><leader>tf",
                function()
                    require("neotest").run.run(vim.fn.expand("%"))
                end,
                desc = "Neotest: Ejecutar archivo de prueba actual",
            },
            {
                mode = "n",
                "<leader><leader>tn",
                function()
                    require("neotest").run.run()
                end,
                desc = "Neotest: Ejecutar la prueba más cercana.",
            },
            {
                mode = "n",
                "<leader><leader>td",
                function()
                    require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
                end,
                desc = "Neotest: Depurar archivo de prueba actual.",
            },
            {
                mode = "n",
                "<leader><leader>tD",
                function()
                    require("neotest").run.run({ strategy = "dap" })
                end,
                desc = "Neotest: Depurar la prueba más cercana.",
            },
            {
                mode = "n",
                "<leader><leader>tS",
                function()
                    require("neotest").run.stop()
                end,
                desc = "Neotest: Detener la prueba más cercana.",
            },
            {
                mode = "n",
                "<leader><leader>ta",
                function()
                    require("neotest").run.attach()
                end,
                desc = "Neotest: Adjuntar a la prueba más cercana.",
            },
            {
                mode = "n",
                "<leader><leader>tt",
                function()
                    require("neotest").output_panel.toggle()
                end,
                desc = "Neotest: Abrir/Cerrar panel de salida.",
            },
            {
                mode = "n",
                "<leader><leader>ts",
                function()
                    require("neotest").summary.toggle()
                end,
                desc = "Neotest: Abrir/Cerrar panel de resumen.",
            },
        },
    },
}
