return {
    {
        -- DESC: The missing UI extensions for Vim 8.2 (and NeoVim 0.4)
        "skywind3000/vim-quickui",
        --lazy = false,
        keys = {
            { mode = "n", "<Space>mu", "<cmd>call quickui#menu#open()<cr>" },
            { mode = "v", "<Space>mu", "<cmd>call quickui#menu#open()<cr>" },
            { mode = "i", "<Space>mu", "<cmd>call quickui#menu#open()<cr>" },
        },
        init = function()
            vim.g.quickui_border_style = 2
        end,
        --opts = {
        --}.
        config = function()
            vim.api.nvim_call_function("QuickThemeChange", { "gruvbox" }) -- DESC: Set gruvbox theme
            --vim.api.nvim_call_function("quickui#menu#reset", {})        -- DESC: Reset all menu's
            vim.g.quickui_show_tip = 1

            --#######################################################
            --#                        Menu's
            --#######################################################

            -- DESC: Section of File menu config.
            vim.api.nvim_call_function("quickui#menu#install", {
                "&File",
                {
                    { "&New File\t", "lua MakeNewFile()" },
                    { "&Open File\t", "Telescope find_files" },
                    { "&Close", "" },
                    { "--", "" },
                    { "&Copy", "y", "help 1" },
                    { "&Paste", "p", "help 2" },
                    { "&Find", 'execute "normal! *"', "help 3" },
                    { "--", "" },
                    { "&Save\t", "w" },
                    { "Save &As", "echo 4" },
                    { "Save All", "wa" },
                    { "--", "" },
                    { "E&xit\t", "q" },
                },
            })
            function MakeNewFile()
                local filename = vim.fn.input("Enter filename: ")
                if filename == "" then
                    print("Filename cannot be empty")
                    return
                end
                vim.api.nvim_command("e " .. filename)
            end

            -- DESC: Section of Build menu config.
            vim.api.nvim_call_function("quickui#menu#install", {
                "&Build",
                {
                    { "Run overseer\t <leader>oor", "OverseerRun" },
                    { "Toggle overseer panel\t <leader>oot", "OverseerToggle" },
                    { "--", "" },
                    { "&Markdown", "lua LBUIMarkdown()" },
                    { "J&ava", "lua LBUIJava()" },
                    {
                        "&Python",
                        "lua vim.api.nvim_call_function('quickui#terminal#open', {'python', TerminalQuickUIoptsPython})",
                    },
                    { "&Web", "lua LBUIWeb()" },
                    { "Ha&skell", "lua LBUIHaskell()" },
                },
            })
            function TermExit(code)
                print("terminal exit code: " .. code)
            end
            TerminalQuickUIoptsPython = {
                w = 110,
                h = 25,
                relative = "editor",
                title = "Terminal Popup",
            }
            -- DESC: Section of Test menu config.
            vim.api.nvim_call_function("quickui#menu#install", {
                "T&est",
                {
                    {
                        "Run &current file\t <leader><leader>tf",
                        "lua require('neotest').run.run(vim.fn.expand(' % '))",
                    },
                    { "Run &nearest test\t <leader><leader>tn", "lua require('neotest').run.run()" },
                    {
                        "Debug Current &file\t <leader><leader>td",
                        "lua require('neotest').run.run({ vim.fn.expand('%'), strategy = 'dap' })",
                    },
                    {
                        "&Debug nearest test\t <leader><leader>tD",
                        "lua require('neotest').run.run({ strategy = 'dap' })",
                    },
                    { "&Stop test\t <leader><leader>tS", "lua require('neotest').run.stop()" },
                    { "&Attach to nearest test\t <leader><leader>ta", "lua require('neotest').run.attach()" },
                    { "Toggle output &panel\t <leader><leader>tt", "lua require('neotest').output_panel.toggle()" },
                    { "Toggle &summary window\t <leader><leader>ts", "lua require('neotest').summary.toggle()" },
                },
            })

            -- DESC: Section of DAP menu config.
            vim.api.nvim_call_function("quickui#menu#install", {
                "&DAP",
                {
                    { "Open/Close DAP UI\t <leader>du", "lua require('dapui').toggle()" },
                    { "&Start", "lua require('dap').continue()" },
                    { "Step &Over", "lua require('dap').step_over()" },
                    { "Step &Into", "lua require('dap').step_into()" },
                    { "Step &Out", "lua require('dap').step_out()" },
                    { "Toggle &Breakpoint", "lua require('dap').toggle_breakpoint()" },
                    { "Set Breakpoint", "lua require('dap').set_breakpoint()" },
                    {
                        "Set Breakpoint message",
                        "lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))",
                    },
                    { "Repl Open", "lua require('dap').repl.open()" },
                    { "Run Last", "lua require('dap').run_last()" },
                    { "Widgets Hover", "lua require('dap.ui.widgets').hover()" },
                    { "Widgets Preview", "lua require('dap.ui.widgets').preview()" },
                },
            })
            -- DESC: Section of Tools menu config.
            vim.api.nvim_call_function("quickui#menu#install", {
                "&Tools",
                {
                    { "&Telescope", "lua LBUITelescope()" },
                    { "&Git", "lua LBUIGit()" },
                    { "&DataBase", "lua LBUIDataBase()" },
                },
            })
            -- DESC: Section of Lang menu config.
            vim.api.nvim_call_function("quickui#menu#install", {
                "&Lang",
                {
                    { 'Set es Spell %{&spell? "Off":"On"}', "set spell! spelllang=es" },
                    { 'Set us Spell %{&spell? "Off":"On"}', "set spell! spelllang=us" },
                    { "Spell &Mode", "lua ActivateSpellHydra()" },
                    { "-", "" },
                    { "------- To Spanish -------" },
                    { "&Translate popup", "TranslateW --target_lang=es" },
                    { "T&ranslate all popup", "%TranslateW --target_lang=es" },
                    { "Tr&anslate and Replace", "TranslateR --target_lang=es" },
                    { "Tra&nslate and Replace all", "%TranslateR --target_lang=es" },
                    { "--", "" },
                    { "------- To English -------" },
                    { "Tran&slate popup", "TranslateW --target_lang=us" },
                    { "Trans&late all popup", "%TranslateW --target_lang=us" },
                    { "Translat&e and Replace", "TranslateR --target_lang=us" },
                    { "Translate an&d Replace all", "%TranslateR --target_lang=us" },
                },
            })

            -- DESC: Section of Option menu config.
            vim.api.nvim_call_function("quickui#menu#install", {
                "&Option",
                {
                    { 'Set &Cursor Line %{&cursorline? "Off":"On"}', "set cursorline!" },
                    { 'Set &Paste %{&paste? "Off":"On"}', "set paste!" },
                },
            })

            -- DESC: Section of Help menu config.
            vim.api.nvim_call_function("quickui#menu#install", {
                "&Help",
                {
                    { "&Cheatsheet", "help index", "" },
                    { "T&ips", "help tips", "" },
                    { "--", "" },
                    { "&Tutorial", "help tutor", "" },
                    { "&Quick Reference", "help quickref", "" },
                    { "&Summary", "help summary", "" },
                },
                10000,
            })

            --#######################################################
            --#                     ListBox
            --#######################################################

            -- DESC: Markdown ListBox
            ListboxQuickUImarkdown = {
                { "[1] Render on &terminal", "PreviewMarkdown right" },
                { "[2] Render on &browser ", "MarkdownPreviewToggle" },
                { "[3] Render as &pdf     ", "PapyrusStart" },
                { "[4] Generate T&OC      ", "lua LBUIMarkdownGenerateTOC()" },
            }
            function LBUIMarkdown() -- NOTE: Making easy access
                vim.api.nvim_call_function(
                    "quickui#listbox#open",
                    { ListboxQuickUImarkdown, { title = "Markdown Option's" } }
                )
            end

            ListboxQuickUImarkdownGenerateTOC = {
                { "[1] Remo&ve       ->  Remove TOC                              ", "RemoveToc" },
                { "--", "" },
                { "[2] G&FM          ->  Create TOC in GFM link style            ", "GenTocGFM" },
                { "[3] &Redcarpet    ->  Create TOC in Redcarpet link style      ", "GenTocRedcarpet" },
                { "[4] Git&Lab       ->  Create TOC in GitLab link style         ", "GenTocGitLab" },
                { "[5] &Marked       ->  Create TOC using Marked markdown parser ", "GenTocMarked" },
            }
            function LBUIMarkdownGenerateTOC() -- NOTE: Making easy access
                vim.api.nvim_call_function("quickui#listbox#open", {
                    ListboxQuickUImarkdownGenerateTOC,
                    {
                        title = "Option's to Generate TOC",
                        --color = '282828',
                    },
                })
            end

            -- DESC: Java ListBox
            ListboxQuickUIjava = {
                {
                    "[1] j&shell               ->  java shell",
                    "lua vim.api.nvim_call_function('quickui#terminal#open', {'jshell', TerminalQuickUIoptsPython})",
                },
                { "[2] java&c                ->  Compilar el archivo actual", "!javac %" },
                { "[3] &java                 ->  Correr archivo actual", "!java %:t:r" },
                { "[4] &delete class         ->  Borrar .class del archivo actual", "!rm -f %:t:r.class" },
                { "[5] delete &all classs    ->  Borrar todos los archivos compilados", "!rm -f *.class" },
            }
            function LBUIJava() -- NOTE: Making easy access
                vim.api.nvim_call_function("quickui#listbox#open", { ListboxQuickUIjava, { title = "Java Option's" } })
            end

            -- DESC: Web ListBox
            ListboxQuickUIweb = {
                { "[&1] Basic HTML   ", "" },
                { "[&2] Node JS      ", "" },
                { "[&3] Deno         ", "" },
                { "[&4] ", "" },
                { "[&5] ", "" },
                { "[&6] ", "" },
            }
            function LBUIWeb() -- NOTE: Making easy access
                vim.api.nvim_call_function("quickui#listbox#open", { ListboxQuickUIweb, { title = "Web Option's" } })
            end

            -- DESC: Haskell ListBox
            ListboxQuickUIhaskell = {
                { "[1] &Compilar         -> Compilar archivo actual.", "!ghc -o %:t:r %" },
                { "[2] Compilar &todo    -> Compilar todos los archivos Haskell", "" },
                { "[3] &Ejecutar         -> Ejecutar archivo actual.", "!./%:t:r" },
                {
                    "[4] Ejecutar te&rminal-> Ejecutar archivo actual en una terminal",
                    "lua vim.api.nvim_call_function('quickui#terminal#open', {'zsh %:t:r', TerminalQuickUIoptsPython})",
                },
                { "[5] &Limpiar          -> Borrar archivos generados.", "!rm -f %:t:r %:t:r.hi %:t:r.o" },
                { "[6] ", "" },
                { "[7] ", "" },
            }
            function LBUIHaskell() -- NOTE: Making easy access
                vim.api.nvim_call_function(
                    "quickui#listbox#open",
                    { ListboxQuickUIhaskell, { title = "Haskell Option's" } }
                )
            end
            -- DESC: Telescope ListBox
            ListboxQuickUIcommentTODO = {
                { "[&1] Keymaps      ", "Telescope keymaps" },
                { "[&2] File history ", "Telescope oldfiles" },
                { "[&3] Treesitter   ", "Telescope treesitter" },
                { "[&4] Live Grep    ", "Telescope live_grep" },
                { "[&5] Notify       ", "Telescope notify" },
                { "[&6] ToDo Comment ", "TodoTelescope" },
            }
            function LBUITelescope() -- NOTE: Making easy access
                vim.api.nvim_call_function(
                    "quickui#listbox#open",
                    { ListboxQuickUIcommentTODO, { title = "Telescope Option's" } }
                )
            end

            -- DESC: Git ListBox
            ListboxQuickUIGit = {
                { "[&1] Git &Flog             ", "lua LBUIGitFlog()" },
                { "[&2] Advanced Git &Search  ", "AdvancedGitSearch" },
                { "[&3] Git &Remotes          ", "lua LBUIGitRemotes()" },
                { "[&4] Diff Signs           ", "GitGutterSignsToggle" },
                { "[&5] Twiggy               ", "Twiggy" },
                { "[&6] GitHub &Dashboard     ", "GHDashboard" },
                { "test", "lua DressingTest()" },
            }
            function LBUIGit() -- NOTE: Making easy access
                vim.api.nvim_call_function("quickui#listbox#open", { ListboxQuickUIGit, { title = "Git Option's" } })
            end

            -- DESC: GitFlog ListBox
            ListboxQuickUIGitFlog = {
                { "[&1] Full Screen      ", "Flog" },
                { "[&2] Split Window     ", "Flogsplit" },
                { "[&3] Menu             ", "call flogmenu#open_all_windows()" },
            }
            function LBUIGitFlog() -- NOTE: Making easy access
                vim.api.nvim_call_function(
                    "quickui#listbox#open",
                    { ListboxQuickUIGitFlog, { title = "Git Flog Option's" } }
                )
            end

            -- DESC: Git Remotes ListBox
            ListboxQuickUIGitRemotes = {
                { "[&1] List Remotes     ", "GRemoteList" },
                { "[&2] Add Remote       ", "GRemoteAdd" },
                { "[&3] Edit Remote      ", "GRemoteEdit" },
            }
            function LBUIGitRemotes() -- NOTE: Making easy access
                vim.api.nvim_call_function(
                    "quickui#listbox#open",
                    { ListboxQuickUIGitRemotes, { title = "Git Flog Option's" } }
                )
            end

            function DressingTest()
                vim.ui.select({ "apple", "banana", "mango" }, {
                    prompt = "Seleccionar una fruta",
                    telescope = require("telescope.themes").get_cursor(),
                }, function(selected) end)
            end
        end,
    },
}
