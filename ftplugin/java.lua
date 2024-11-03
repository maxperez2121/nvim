-- Revisar el siguiente enlace de configuracion
-- https://sookocheff.com/post/vim/neovim-java-ide/

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = os.getenv("HOME") .. "/jdtls/workspace-root/" .. project_name
local mason = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/"
local bundles = {
    vim.fn.glob(mason .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
}
--vim.split(vim.fn.glob(mason .. "/java-test/extension/server/*.jar", 1), "\n")

local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
        "java", -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx2g", -- Argument: -Xmx  Zise of ram for jvm: 2g
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        -- mason-registry nos trae el siguiente path: /home/nombreUsuario/.local/share/nvim/mason/packages/jdtls
        "-javaagent:"
            .. mason
            .. "/jdtls/lombok.jar",

        "-jar",
        --vim.fn.glob(mason .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
        mason .. "/jdtls/plugins/org.eclipse.equinox.launcher_1.6.800.v20240330-1250.jar",
        "-configuration",
        mason .. "/jdtls/config_linux",
        "-data",
        workspace_dir,
    },
    root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
            excludes = {
                "**/node_modules/**",
                "**/.metadata/**",
                "**/archivos/**",
                "**/bin/**",
                "**/build/**",
                "**/target/**",
            },
        },
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        --bundles = bundles,
        bundles = {
            mason
                .. "~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.47.0.jar",
        },
    },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
