-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- require("lualine").setup({
--   options = {
--     section_separators = { left = "", right = "" },
--     component_separators = { left = "", right = "" },
--   },
-- })
require("lspconfig").eslint.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").marksman.setup({})
require("lspconfig").pug.setup({})
local bufferline = require("bufferline")
bufferline.setup({
  options = {
    numbers = "buffer_id",
  },
})
