--                             _
-- _ __ ___   __ _ _ __  ___  | |_   _  __ _
--| '_ ` _ \ / _` | '_ \/ __| | | | | |/ _` |
--| | | | | | (_| | |_) \__ \_| | |_| | (_| |
--|_| |_| |_|\__,_| .__/|___(_)_|\__,_|\__,_|
--                |_|

-- Asignar la tecla leader
vim.g.mapleader = ","

-- General
vim.api.nvim_set_keymap("n", "<Space>w", ":w<Enter>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>W", ":w!<Enter>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>q", ":q<Enter>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>Q", ":q!<Enter>", { noremap = true })

--vim.api.nvim_set_keymap("i", "ii", "<Esc>", {})
--vim.api.nvim_set_keymap("v", "ii", "<Esc>", {})
--vim.api.nvim_set_keymap("c", "ii", "<Esc>", {})

vim.api.nvim_set_keymap("i", "<A-h>", "<C-e>", {})
vim.api.nvim_set_keymap("i", "<A-j>", "<C-n>", {})
vim.api.nvim_set_keymap("i", "<A-k>", "<C-p>", {})
vim.api.nvim_set_keymap("i", "<A-l>", "<C-y>", {})
vim.api.nvim_set_keymap("i", "<A-c>", "<C-c>", {})

vim.api.nvim_set_keymap("c", "<A-h>", "<C-e>", {})
vim.api.nvim_set_keymap("c", "<A-j>", "<C-n>", {})
vim.api.nvim_set_keymap("c", "<A-k>", "<C-p>", {})
vim.api.nvim_set_keymap("c", "<A-l>", "<C-y>", {})
vim.api.nvim_set_keymap("c", "<A-c>", "<C-c>", {})

-- Terminal
--vim.api.nvim_set_keymap('n', '<space>tv', '<Esc>:rightbelow sfind term://zsh<Enter>', { noremap = true })
--vim.api.nvim_set_keymap('n', '<space>th', '<Esc>:vertical rightbelow sfind term://zsh<Enter>', { noremap = true })

vim.api.nvim_set_keymap("n", "<Leader>cmd", "!!$SHELL<Enter>", { noremap = true })

-- Corrector de escritura
--vim.api.nvim_set_keymap("n", "<leader>sc1", ":setlocal spell! spelllang=es<Enter>", { noremap = true })
--vim.api.nvim_set_keymap("n", "<leader>sc2", ":setlocal spell! spelllang=en<Enter>", { noremap = true })

-- Navegar con guias
--vim.api.nvim_set_keymap("i", ";gui", "<++>", {})
--vim.api.nvim_set_keymap("i", "<leader><leader>", '<Esc>/<++><Enter>"_c4l', {})
--vim.api.nvim_set_keymap("v", "<leader><leader>", '<Esc>/<++><Enter>"_c4l', {})
--vim.api.nvim_set_keymap("n", "<leader><leader>", '<Esc>/<++><Enter>"_c4l', {})

-- Mueve bloques de código en modo visual o V-Line
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true })

-- Buffers
vim.api.nvim_set_keymap("n", "H", "<cmd>bprev<Enter>", { noremap = true })
vim.api.nvim_set_keymap("n", "L", "<cmd>bnext<Enter>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l", "<C-w>l", { noremap = true })
--vim.api.nvim_set_keymap('n', '<Space>bn', '<cmd>new<Enter>', { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>bd", "<cmd>BW<cr>", { noremap = true })

-- Pestañas (Tabs)
vim.api.nvim_set_keymap("n", "<A-S-Tab>", "<cmd>tabprevious<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-Tab>", "<cmd>tabNext<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>tc", "<cmd>tabclose<cr>", { noremap = true })

--vim.api.nvim_set_keymap("n", "<leader>th", "<C-w>t<C-w>H", {}) -- Cambiar Split a horizontal
--vim.api.nvim_set_keymap("n", "<leader>tk", "<C-w>t<C-w>K", {}) -- Cambiar Split a vertical

-- Clipboard
vim.api.nvim_set_keymap("v", "y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "yy", '"+yy', { noremap = true })
vim.api.nvim_set_keymap("v", "p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "d", '"+d', { noremap = true })
vim.api.nvim_set_keymap("n", "dd", '"+dd', { noremap = true })
