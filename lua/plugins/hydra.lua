return {
    {
        -- DESC: Create custom submodes and menus.
        --"anuvyklack/hydra.nvim",
        "nvimtools/hydra.nvim",
        config = function()
            -- ###########################################################
            -- #                    Scroll Mode
            -- ###########################################################
            local scrollLegend = [[
 _k_: ↑ Half Scroll     _h_: ↑ Full Scroll
 _j_: ↓ Half Scroll     _l_: ↓ Full Scroll
 ^
 ^ ^        _q_/_<Esc>_: exit
]]
            local modeScroll = require("hydra")
            modeScroll({
                name = "Scroll",
                hint = scrollLegend,
                config = {
                    color = "pink",
                    invoke_on_body = true,
                    -- NOTE: para mas opciones ver :h hydra-hint-hint-configuration
                    hint = {
                        type = "window", -- OPTS: "window", "cmdline", "statusline", "statuslinemanual"
                        position = "bottom",
                        offset = 1,
                        show_name = true,

                        -- options passed to `nvim_open_win()`, see :h nvim_open_win()
                        -- Lets you set border, header, footer, etc etc.
                        float_opts = {
                            -- row, col, height, width, relative, and anchor should not be
                            -- overridden
                            --style = "minimal",
                            --focusable = false,
                            --noautocmd = true,
                            border = "rounded",
                        },
                    },
                    on_enter = function()
                        vim.o.virtualedit = "all"
                    end,
                },
                mode = "n",
                body = "<leader>ms",
                heads = {
                    { "k", "<C-u>" },
                    { "j", "<C-d>" },
                    -- half page
                    { "h", "<C-b>" },
                    { "l", "<C-f>" },
                    { "q", nil, { exit = true } },
                    { "<Esc>", nil, { exit = true } },
                },
            })

            -- ###########################################################
            -- #                    Window Mode
            -- ###########################################################
            local windowLegend = [[
 Arrow^^^^^^    _s_: Horizontal split    Rezise^^^^^ 
 ^ ^ _k_ ^ ^    _v_: Vertical split      ^ ^ _K_ ^ ^ 
 _h_ ^ ^ _l_    _x_: Close window        _H_ ^ ^ _L_ 
 ^ ^ _j_ ^ ^    _f_: Fullscreen window   ^ ^ _J_ ^ ^ 
 ^ ^ ^ ^ ^ ^    _o_: Only this
 ^
 ^ ^    _q_/_<Esc>_: exit
]]
            local windowScroll = require("hydra")
            windowScroll({
                name = "Window",
                hint = windowLegend,
                config = {
                    color = "pink",
                    invoke_on_body = true,
                    hint = {
                        type = "window", -- OPTS: "window", "cmdline", "statusline", "statuslinemanual"
                        position = "bottom",
                        offset = 1,
                        show_name = true,

                        -- options passed to `nvim_open_win()`, see :h nvim_open_win()
                        -- Lets you set border, header, footer, etc etc.
                        float_opts = {
                            -- row, col, height, width, relative, and anchor should not be
                            -- overridden
                            --style = "minimal",
                            --focusable = false,
                            --noautocmd = true,
                            border = "rounded",
                        },
                    },
                    on_enter = function()
                        vim.o.virtualedit = "all"
                    end,
                },
                mode = "n",
                body = "<leader>mw",
                heads = {
                    -- Arrows
                    { "h", "<C-w>h" },
                    { "l", "<C-w>l" },
                    { "j", "<C-w>j" },
                    { "k", "<C-w>k" },
                    -- Splits
                    { "s", "<cmd>split<cr>" },
                    { "v", "<cmd>vsplit<cr>" },
                    { "x", "<cmd>close<cr>" },
                    { "f", "<C-W>ge" },
                    { "o", "<cmd>only<cr>" },
                    -- Rezise
                    { "H", "<C-w><" },
                    { "L", "<C-w>>" },
                    { "J", "<cmd>resize -3<cr>" },
                    { "K", "<cmd>resize +3<cr>" },
                    -- Salir del modo
                    { "q", nil, { exit = true } },
                    { "<Esc>", nil, { exit = true } },
                },
            })

            -- ###########################################################
            -- #                    Spell Mode
            -- ###########################################################

            local spellLegend = [[
 _k_: ↑ Previous bad word   _s_: Spell suggest
 _j_: ↓ Next bad word
 ^
 ^ ^        _q_/_<Esc>_: exit
]]
            local modeSpell = require("hydra")
            local containSpell = modeSpell({
                name = "Spell",
                hint = spellLegend,
                config = {
                    color = "pink",
                    invoke_on_body = true,
                    hint = {
                        type = "window", -- OPTS: "window", "cmdline", "statusline", "statuslinemanual"
                        position = "bottom",
                        offset = 1,
                        show_name = true,

                        -- options passed to `nvim_open_win()`, see :h nvim_open_win()
                        -- Lets you set border, header, footer, etc etc.
                        float_opts = {
                            -- row, col, height, width, relative, and anchor should not be
                            -- overridden
                            --style = "minimal",
                            --focusable = false,
                            --noautocmd = true,
                            border = "rounded",
                        },
                    },
                    on_enter = function()
                        vim.o.virtualedit = "all"
                    end,
                },
                mode = "n",
                heads = {
                    { "k", "[s" },
                    { "j", "]s" },
                    { "s", "z=" },
                    { "q", nil, { exit = true } },
                    { "<Esc>", nil, { exit = true } },
                },
            })
            function ActivateSpellHydra()
                containSpell:activate()
            end

            -- ###########################################################
            -- #                        Git Mode
            -- ###########################################################
            local gitLegend = [[
  ^ ^        Options
  ^
  _a_ Add this to stage
  _A_ Add all to stage
  _r_ Remove this to stage
  _R_ Force to remove this to stage
  _d_ Diff stage vs wroking tree  
  _c_ Git commit
  _l_ GRemoteList
  _g_ GRemoteAdd
  ^
 ^ ^        _q_/_<Esc>_: exit
            ]]
            local modeGit = require("hydra")
            function InputCommit()
                local commitPromp = vim.fn.input("Commit comment: ")
                if commitPromp == "" then
                    print("Commit comment was empty")
                    return
                end
                vim.api.nvim_command("Git commit -m " .. "'" .. commitPromp .. "'")
            end
            function GitRemoteADD()
                local GRemoteAddName = vim.fn.input("Remote name: ")
                local GRemoteAddURL = vim.fn.input("URL: ")
                if GRemoteAddName == "" then
                    print("Remote name field was empty")
                    return
                end
                if GRemoteAddURL == "" then
                    print("URL field was empty")
                    return
                end
                vim.api.nvim_command("GRemoteAdd " .. GRemoteAddName .. GRemoteAddURL)
            end
            modeGit({
                name = "Git options",
                hint = gitLegend,
                config = {
                    color = "pink",
                    invoke_on_body = true,
                    hint = {
                        type = "window", -- OPTS: "window", "cmdline", "statusline", "statuslinemanual"
                        position = "bottom",
                        offset = 1,
                        show_name = true,

                        -- options passed to `nvim_open_win()`, see :h nvim_open_win()
                        -- Lets you set border, header, footer, etc etc.
                        float_opts = {
                            -- row, col, height, width, relative, and anchor should not be
                            -- overridden
                            --style = "minimal",
                            --focusable = false,
                            --noautocmd = true,
                            border = "rounded",
                        },
                    },
                    on_enter = function()
                        vim.o.virtualedit = "all"
                    end,
                },
                mode = "n",
                body = "<leader>mg",
                heads = {
                    { "a", "<cmd>Git add % | echo 'Added to stage'<cr>" },
                    { "A", "<cmd>Git add . | echo 'All added to stage'<cr>" },
                    { "r", "<cmd>Git rm --cached %<cr>" },
                    { "R", "<cmd>Git rm --cached -f %<cr>" },
                    { "d", "<cmd>Gvdiffsplit<cr>", { exit = true } },
                    { "c", "<cmd>lua InputCommit()<cr>", { exit = true } },
                    { "l", "<cmd>GRemoteList<cr>", { exit = true } },
                    { "g", "<cmd>lua GitRemoteADD()<cr>", { exit = true } },
                    { "q", nil, { exit = true } },
                    { "<Esc>", nil, { exit = true } },
                },
            })
            -- ###########################################################
            -- #                    kulala Mode
            -- ###########################################################
            local kulalaLegend = [[
 _r_: Run kulala    _k_: ↑ Jump previus
 _T_: Toggle view   _j_: ↓ Jump next
 ^
 ^ ^    _q_/_<Esc>_: exit
]]
            local kulalaScroll = require("hydra")
            kulalaScroll({
                name = "Kulala",
                hint = kulalaLegend,
                config = {
                    color = "pink",
                    invoke_on_body = true,
                    hint = {
                        type = "window", -- OPTS: "window", "cmdline", "statusline", "statuslinemanual"
                        position = "bottom",
                        offset = 1,
                        show_name = true,

                        -- options passed to `nvim_open_win()`, see :h nvim_open_win()
                        -- Lets you set border, header, footer, etc etc.
                        float_opts = {
                            -- row, col, height, width, relative, and anchor should not be
                            -- overridden
                            --style = "minimal",
                            --focusable = false,
                            --noautocmd = true,
                            border = "rounded",
                        },
                    },
                    --on_enter = function()
                    --vim.o.virtualedit = "all"
                    --end,
                },
                mode = "n",
                body = "<leader>mk",
                heads = {
                    { "r", "<cmd>lua require('kulala').run()<cr>" },
                    { "T", "<cmd>lua require('kulala').toggle_view()<cr>" },
                    { "k", "<cmd>lua require('kulala').jump_prev()<cr>" },
                    { "j", "<cmd>lua require('kulala').jump_next()<cr>" },
                    -- Salir del modo
                    { "q", nil, { exit = true } },
                    { "<Esc>", nil, { exit = true } },
                },
            })
        end,
        keys = {
            { mode = "n", "<leader>ms", dec = "" },
            { mode = "n", "<leader>mw", dec = "" },
            { mode = "n", "<leader>mg", dec = "" },
            { mode = "n", "<leader>mk", dec = "" },
        },
    },
}
