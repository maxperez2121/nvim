local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    install = { colorscheme = { "gruvbox_material" } },
    spec = {
        {
            import = "plugins",
        },
        {
            import = "plugins.ide",
        },
        {
            import = "plugins.lsp",
        },
    },
    defaults = {
        lazy = true,
    },
    --install = { colorscheme = { "tokyonight" } },
})
