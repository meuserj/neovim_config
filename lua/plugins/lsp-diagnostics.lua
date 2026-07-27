-- Suppress LSP diagnostics while in insert mode for large files
local large_file_threshold = 5000 -- lines

return {
  "neovim/nvim-lspconfig",
  opts = function()
    local orig_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
      local bufnr = vim.uri_to_bufnr(result.uri)
      local line_count = vim.api.nvim_buf_line_count(bufnr)

      if line_count > large_file_threshold and vim.api.nvim_get_mode().mode:sub(1, 1) == "i" then
        vim.api.nvim_create_autocmd("InsertLeave", {
          buffer = bufnr,
          once = true,
          callback = function()
            orig_handler(err, result, ctx, config)
          end,
        })
        return
      end

      orig_handler(err, result, ctx, config)
    end
  end,
}
