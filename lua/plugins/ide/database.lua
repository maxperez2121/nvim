return {
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            "tpope/vim-dadbod",
            "tpope/vim-dotenv",
        },
        config = function()
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_show_database_icon = 1
            vim.g.db_ui_force_echo_notifications = 1
            vim.g.db_ui_table_helpers = {
                postgresql = {
                    List = "select * from {table} order by id asc",
                },
                sqlserver = {
                    MyTables = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'",
                    Vertion = "SELECT @@VERSION",
                },
                mysql = {
                    Count = "select count(1) from {optional_schema}{table}",
                    Explain = "EXPLAIN {last_query}",
                },
            }
            vim.g.db_ui_icons = {
                expanded = {
                    db = "▾ ",
                    buffers = "▾ ",
                    saved_queries = "▾ ",
                    schemas = "▾ ",
                    schema = "▾ פּ",
                    tables = "▾ 藺",
                    table = "▾ ",
                },
                collapsed = {
                    db = "▸ ",
                    buffers = "▸ ",
                    saved_queries = "▸ ",
                    schemas = "▸ ",
                    schema = "▸ פּ",
                    tables = "▸ 藺",
                    table = "▸ ",
                },
                saved_query = "",
                new_query = "璘",
                tables = "離",
                buffers = "﬘",
                add_connection = "",
                connection_ok = "✓",
                connection_error = "✕",
            }

            vim.g.dbs = {
                --Northwind = "sqlserver://127.0.0.1:1433;user=sa;password=Contrasena;trustServerCertificate=yes;database=Northwind",
                mysql = "mysql://root:Password@172.17.0.2:3306/mysql",
                db_tortaza = "mysql://root:Password@172.17.0.2:3306/db_tortaza",
                TortazaSAC = "mysql://root:Password@172.17.0.2:3306/TortazaSAC",
                db_hospital = "mysql://root:Password@172.17.0.2:3306/db_hospital",
                db_tefisa = "mysql://root:Password@172.17.0.2:3306/db_tefisa",
                --EstructuraDatos = "mysql://root:Password@172.17.0.2:3306/mysql",
            }
            -- Northwind = 'sqlserver://sa:MiContrasena@localhost:1433/Northwind',
            -- Northwind = 'sqlserver://localhost:1433;user=sa;password=123456;database=Northwind',
            -- sqlserver://[<host>[:<port>]][;user=<user>][;...]
            -- sqlserver://[<user>[:<password>]@][<host>][:<port>]/[<database>]

            vim.g.db_ui_save_location = vim.fn.getcwd() .. "/DataBase"
        end,
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        keys = {
            { mode = "n", "<leader>db", "<cmd>tabnew | DBUI<cr>", desc = "" },
            { mode = "n", "<leader>dt", "<cmd>DBUIToggle<cr>", desc = "" },
        },
    },
}
