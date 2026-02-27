-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.title = true
vim.opt.titlestring = "%t %m - nvim"
vim.opt.clipboard = "unnamedplus"
vim.opt.formatexpr = ""

vim.g.autoformat = false

vim.g.session_autosave = "yes"
vim.g.session_autosave_periodic = 30
vim.g.session_autosave_silent = 1
vim.g.session_autoload = "no"
vim.g.session_default_to_last = 0

vim.g.airline_theme = "base16_gruvbox_dark_hard"
vim.g.airline_left_sep = ""
vim.g.airline_left_alt_sep = ""
vim.g.airline_right_sep = ""
vim.g.airline_right_alt_sep = ""
vim.g.airline_powerline_fonts = 1

vim.o.guifont = "IosevkaTerm Nerd Font Mono:h9"

vim.g.tmuxline_separators = {
  left = "",
  left_alt = "",
  right = "",
  right_alt = "",
  space = " ",
}

vim.g.promptline_symbols = {
  left = "",
  left_alt = "",
  right = "",
  right_alt = "",
  space = " ",
  truncation = "⋯",
}
