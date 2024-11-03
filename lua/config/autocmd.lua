-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local vim = vim.api
vim.nvim_command("autocmd BufRead,BufNewFile *.http set filetype=http")
vim.nvim_command("autocmd BufRead,BufNewFile *.env set filetype=env")
--vim.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--pattern = { "*.http" },
--command = { "set filetype=http" },
--})
--vim.cmd("command! BW :bn|:bd#")
vim.nvim_create_user_command("BW", "bn | bd#", {})
