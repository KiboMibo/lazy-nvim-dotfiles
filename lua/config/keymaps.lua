-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  { "n", "v", "o", "i", "x" },
  "<ScrollWheelLeft>",
  "<ScrollWheelRight>",
  { noremap = true }
)
vim.keymap.set(
  { "n", "v", "o", "i", "x" },
  "<ScrollWheelRight>",
  "<ScrollWheelLeft>",
  { noremap = true }
)
