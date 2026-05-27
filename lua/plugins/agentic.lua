return {
  "carlos-algms/agentic.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<C-\\>",
      function() require("agentic").toggle() end,
      desc = "Toggle Agentic Chat",
      mode = { "n", "v", "i" },
    },
    {
      "<leader>as",
      function() require("agentic").switch_provider() end,
      desc = "Switch Agentic Provider",
      mode = "n",
    }
  },
  config = function()
    local profile = os.getenv("NVIM_PROFILE") or "home"
    local active_provider = "opencode-acp"
    if profile == "work" then
      active_provider = "cursor-acp"
    end

    require("agentic").setup({
      provider = active_provider,
      auto_add_to_context = true,
      acp_providers = {
        ["opencode-acp"] = {
          command = "agy-acp",
          args = {},
        }
      }
    })
  end,
}
