-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

map("i", "<F3>", "<ESC>:Neotree filesystem reveal float<CR>")
map("i", "<F4>", "<ESC>:Neotree filesystem float<CR>")
map("i", "<F5>", "<ESC>:Neotree buffers float<CR>")
map("i", "<F6>", "<ESC>:Neotree git_status float<CR>")
map("i", "<F7>", "<ESC>:bprevious<cr>")
map("i", "<F8>", "<ESC>:bnext<cr>")
map("n", "<F3>", ":Neotree filesystem reveal float<CR>")
map("n", "<F4>", ":Neotree filesystem float<CR>")
map("n", "<F5>", ":Neotree buffers float<CR>")
map("n", "<F6>", ":Neotree git_status float<CR>")
map("n", "<F7>", ":bprevious<cr>")
map("n", "<F8>", ":bnext<cr>")
map("n", "<C-z>", ":bp <BAR> bd #<cr>")
map("v", "<Enter>", "<Plug>(EasyAlign)")
