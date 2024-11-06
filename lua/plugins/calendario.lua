return {
    {
        "itchyny/calendar.vim",
        config = function()
            vim.g.calendar_frame = "default"
            function ToggleCalendar()
                vim.cmd("Calendar -view=year -split=vertical -position=left -width=27")
                if vim.g.calendar_open then
                    if vim.g.calendar_open == 1 then
                        vim.cmd("q")
                        vim.g.calendar_open = nil
                    else
                        vim.g.calendar_open = 1
                    end
                else
                    vim.g.calendar_open = 1
                end
            end
        end,
        cmd = {
            "Calendar",
        },
        keys = {
            {
                mode = "n",
                "<leader>tc",
                "<cmd>lua ToggleCalendar()<cr>",
                desc = "Abrir/Cerrar calendario",
            },
        },
    },
}
