return {
    -- DESC: Create files from predefined templates.
    "tibabit/vim-templates",
    config = function()
        vim.g.tmpl_search_paths = "~/.config/nvim/vim-templates"
    end,
}
