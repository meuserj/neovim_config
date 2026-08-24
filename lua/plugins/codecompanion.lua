return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<C-\\>",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Toggle CodeCompanion Chat",
      mode = { "n", "v", "i" },
    },
    {
      "<leader>as",
      "<cmd>CodeCompanionActions<cr>",
      desc = "CodeCompanion Actions",
      mode = { "n", "v" },
    },
  },
  config = function()
    local profile = os.getenv("NVIM_PROFILE") or "home"

    local acp_adapters = {}
    if profile == "work" then
      acp_adapters.claude_code = function()
        return require("codecompanion.adapters").extend("claude_code", {
          -- Upstream default maps this to the literal string "CLAUDE_CODE_OAUTH_TOKEN"
          -- when that env var isn't set, which gets sent as a bogus bearer token
          -- (401 Invalid bearer token). `extend` deep-merges, so an empty table here
          -- wouldn't clear the key -- force it to resolve to "" instead (via the
          -- "cmd:" env-var-resolution path) so auth() and the subprocess env both
          -- treat it as unset and fall back to the native `claude login` credentials.
          env = { CLAUDE_CODE_OAUTH_TOKEN = "cmd:true" },
        })
      end
    else
      acp_adapters.opencode = function()
        return require("codecompanion.adapters").extend("opencode", {

          commands = {
            default = { vim.fn.expand("~/.local/bin/agy-acp") },
          },
        })
      end
    end

    local chat_adapter = profile == "work" and "claude_code" or "opencode"

    require("codecompanion").setup({
      strategies = {
        chat = { adapter = chat_adapter },
        inline = { adapter = chat_adapter },
      },
      adapters = {
        acp = acp_adapters,
      },
      interactions = {
        chat = {
          tools = {
            ["read_file"] = { opts = { require_approval_before = false } },
            ["file_search"] = { opts = { require_approval_before = false } },
            ["grep_search"] = { opts = { require_approval_before = false } },
            ["get_diagnostics"] = { opts = { require_approval_before = false } },
            ["get_changed_files"] = { opts = { require_approval_before = false } },
          },
        },
        shared = {
          keymaps = {
            always_accept = { modes = { n = "Y" }, callback = "keymaps.always_accept", description = "Always accept changes", index = 1, opts = { nowait = true } },
            accept_change = { modes = { n = "y" }, callback = "keymaps.accept_change", description = "Accept change", index = 2, opts = { nowait = true, noremap = true } },
            reject_change = { modes = { n = "n" }, callback = "keymaps.reject_change", description = "Reject change", index = 3, opts = { nowait = true, noremap = true } },
            cancel = { description = "Cancel all pending tool calls", modes = { n = "X" }, index = 4, opts = { nowait = true } },
          },
        },
      },
    })
  end,
}
