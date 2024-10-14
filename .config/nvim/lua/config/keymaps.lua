-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Navigate vim panes better
vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<CR>", { desc = "Window left" })
vim.keymap.set("n", "<c-j>", ":TmuxNavigateDown<CR>", { desc = "Window down" })
vim.keymap.set("n", "<c-k>", ":TmuxNavigateUp<CR>", { desc = "Window up" })
vim.keymap.set("n", "<c-l>", ":TmuxNavigateRight<CR>", { desc = "Window right" })
