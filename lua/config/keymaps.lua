-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
  desc = "Move selected line(s) down",
  silent = true,
})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
  desc = "Move selected line(s) up",
  silent = true,
})
