return {
    {
        -- Un complemento de ejecución de tareas y gestión de trabajos para Neovim
        "stevearc/overseer.nvim",
        --lazy = false,
        event = "VeryLazy",
        --opts = {},
        config = function()
            require("overseer").setup({
                templates = {
                    "builtin",
                    "overtasks",
                },
            })
        end,
        cmd = {
            "OverseerRun",
            "OverseerToggle",
            "OverseerQuickAction",
        },
        keys = {
            { mode = "n", "<leader>oor", "<cmd>OverseerRun<cr>", desc = "Overseer: Correr codigo" },
            { mode = "n", "<leader>oot", "<cmd>OverseerToggle<cr>", desc = "Overseer: Abrir/Cerrar panel" },
            { mode = "n", "<leader>ooa", "<cmd>OverseerQuickAction<cr>", desc = "Overseer: Acciones" },
        },
    },
    {
        -- Ejecutar programas de forma asincrónica
        "pianocomposer321/officer.nvim",
        event = "VeryLazy",
        dependencies = "stevearc/overseer.nvim",
        config = function()
            require("officer").setup({
                create_mappings = false,
                -- config
            })
        end,
    },
    --{
    ---- DESC:  Implementar Java war (o ear) en Tomcat, JBoss o Wildfly
    --"javiorfo/nvim-wildcat",
    --dependencies = { "javiorfo/nvim-popcorn" },
    --opts = {
    ---- DESC: No es necesario.  Sólo si deseas cambiar la configuración.
    ---- Los siguientes son los valores predeterminados
    --console_size = 15,
    --jboss = {
    --home = "JBOSS_HOME",
    --app_base = "standalone/deployments",
    --default = true,
    --},
    --tomcat = {
    --home = "CATALINA_HOME",
    --app_base = "webapps",
    --default = false,
    --},
    --},
    --cmd = {
    --"WildcatClean",
    --"WildcatDeploy",
    --"WildcatDown",
    --"WildcatEnableJBoss",
    --"WildcatEnableTomcat",
    --"WildcatInfo",
    --"WildcatRun",
    --"WildcatUp",
    --},
    --},
    --{
    ---- DESC: Un recargador en caliente que funciona con cualquier lenguaje de programación.
    --"sachinsenal0x64/hot.nvim",
    --config = function()
    --vim.opt.autochdir = true
    --local opts = require("hot.params").opts

    ---- Update the Lualine Status
    --Reloader = opts.tweaks.default
    --Reloader = "💤"

    --Pattern = opts.tweaks.patterns
    --Pattern = { "main.py", "main.go" }

    --opts.tweaks.start = "🚀"
    --opts.tweaks.stop = "💤"
    --opts.tweaks.test = "🧪"
    --opts.tweaks.test_done = "🧪.✅"
    --opts.tweaks.test_fail = "🧪.❌"

    ---- If the 'main.*' file doesn't exist, it will fall back to 'index.*'
    --opts.tweaks.custom_file = "index"

    ---- Add Languages
    --opts.set.languages.python = {
    --cmd = "python3",
    --desc = "Run Python file asynchronously",
    --kill_desc = "Kill the running Python file",
    --emoji = "🐍",
    --test = "python -m unittest -v",
    --ext = { ".py" },
    --}

    --opts.set.languages.go = {
    --cmd = "go run",
    --desc = "Run Go file asynchronously",
    --kill_desc = "Kill the running Go file",
    --emoji = "🐹",
    --test = "go test",
    --ext = { ".go" },
    --}

    ---- Thot Health Check
    --vim.api.nvim_set_keymap(
    --"n",
    --"ho",
    --'<Cmd>lua require("thot").check()<CR>',
    --{ noremap = true, silent = true }
    --)

    ---- Keybinds

    ---- Start
    --vim.api.nvim_set_keymap(
    --"n",
    --"<F3>",
    --'<Cmd>lua require("hot").restart()<CR>',
    --{ noremap = true, silent = true }
    --)
    ---- Silent
    --vim.api.nvim_set_keymap(
    --"n",
    --"<F4>",
    --'<Cmd>lua require("hot").silent()<CR>',
    --{ noremap = true, silent = true }
    --)
    ---- Stop
    --vim.api.nvim_set_keymap(
    --"n",
    --"<F5>",
    --'<Cmd>lua require("hot").stop()<CR>',
    --{ noremap = true, silent = true }
    --)
    ---- Test
    --vim.api.nvim_set_keymap(
    --"n",
    --"<F6>",
    --'<Cmd>lua require("hot").test_restart()<CR>',
    --{ noremap = true, silent = true }
    --)
    ---- Close Buffer
    --vim.api.nvim_set_keymap(
    --"n",
    --"<F8>",
    --'<Cmd>lua require("hot").close_output_buffer()<CR>',
    --{ noremap = true, silent = true }
    --)
    ---- Open Buffer
    --vim.api.nvim_set_keymap(
    --"n",
    --"<F7>",
    --'<Cmd>lua require("hot").open_output_buffer()<CR>',
    --{ noremap = true, silent = true }
    --)

    ---- Auto Reload on Save

    --local save_group = vim.api.nvim_create_augroup("save_mapping", { clear = true })
    --vim.api.nvim_create_autocmd("BufWritePost", {
    --desc = "Reloader",
    --group = save_group,
    --pattern = Pattern,
    --callback = function()
    --require("hot").silent()
    --end,
    --})
    --end,
    --},
}
