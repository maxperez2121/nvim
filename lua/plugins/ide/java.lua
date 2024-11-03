return {
    {
        -- WARN: No se como se usa xDD
        "simaxme/java.nvim",
        ft = {
            "java",
        },
        config = function()
            require("java").setup()
        end,
    },
    {
        -- FIX: Require jdk or open-jdk and eclipse was installed.
        -- DESC: A mirror of the VIM files from Eclim to support quick and convenient installation via various plugin managers.
        "dansomething/vim-eclim",
        enabled = false,
        ft = {
            "java",
            --"class",
            --"jar",
            "war",
            "ear",
            "jsp",
            "jspx",
            --"properties",
        },
    },
}
