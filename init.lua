-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Read system background from the shell environment
if vim.env.DARK_MODE == "false" then
  vim.o.background = "light"
else
  vim.o.background = "dark"
end

if not vim.g.vscode then
  vim.lsp.config("eslint", {
    settings = {
      workingDirectories = { mode = "auto" },
    },
  })
  vim.lsp.enable("eslint")
  vim.lsp.enable("jsonls")
  vim.lsp.enable("marksman")
  vim.cmd([[colorscheme gruvbox]])
  require("aerial").setup({
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
  })
  require("neogit").setup({
    graph_style = "unicode",
    kind = "floating",
    commit_editor = {
      kind = "floating",
    },
    commit_select_view = {
      kind = "floating",
    },
  })
  require("lualine").setup({
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
  })
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
end

-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
