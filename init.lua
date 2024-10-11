-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

require("lspconfig").eslint.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").marksman.setup({})
require("lspconfig").pug.setup({})
local bufferline = require("bufferline")
bufferline.setup({
  options = {
    numbers = "buffer_id",
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    custom_areas = {
      right = function()
        local result = {}
        local seve = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
        local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
        local info = #vim.diagnostic.get(0, { severity = seve.INFO })
        local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

        if error ~= 0 then
          table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
        end

        if warning ~= 0 then
          table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
        end

        if hint ~= 0 then
          table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
        end

        if info ~= 0 then
          table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
        end
        return result
      end,
    },
  },
})
