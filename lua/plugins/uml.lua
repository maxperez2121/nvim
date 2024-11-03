return {
    {
        -- DESC: vim syntax file for plantuml
        "aklt/plantuml-syntax",
        event = "VeryLazy",
        ft = {
            "plantuml",
            "pu",
            "uml",
            "puml",
            "iuml",
        },
    },
    {
        -- DESC: Inline previews for Plantuml sequence diagrams
        "scrooloose/vim-slumlord",
        --event = "VeryLazy",
        ft = {
            "plantuml",
            "pu",
            "uml",
            "puml",
            "iuml",
        },
    },
    {
        -- DESC: Vim / Neovim plugin for preview PlantUML
        "weirongxu/plantuml-previewer.vim",
        --event = "VeryLazy",
        dependencies = {
            "tyru/open-browser.vim",
        },
        ft = {
            "plantuml",
            "pu",
            "uml",
            "puml",
            "iuml",
        },
    },
}
