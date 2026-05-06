-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.title = true
vim.opt.titlestring = "%t %m - nvim"
vim.opt.clipboard = "unnamedplus"
vim.opt.formatexpr = ""

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.g.autoformat = false

vim.g.session_autosave = "yes"
vim.g.session_autosave_periodic = 30
vim.g.session_autosave_silent = 1
vim.g.session_autoload = "no"
vim.g.session_default_to_last = 0

vim.o.guifont = "IosevkaTerm Nerd Font Mono:h9"
