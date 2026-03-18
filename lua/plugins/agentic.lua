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
    },
    { "<leader>ar", function() require("agentic").restore_session() end, desc = "Agentic: Restore Session" },
    { "<leader>an", function() require("agentic").new_session() end, desc = "Agentic: New Session" },
  },
  config = function()
    local profile = os.getenv("NVIM_PROFILE") or "home"
    
    -- At home we use "gemini". At work, we pretend to use "opencode-acp"
    local active_provider = "gemini-acp"
    if profile == "work" then
      active_provider = "opencode-acp"
    end

    require("agentic").setup({
      provider = active_provider,
      auto_add_to_context = true,
      
      acp_providers = {
        -- Hijack the opencode-acp slot to run Kiro instead!
        ["opencode-acp"] = {
          command = "kiro-cli",
          args = { "acp" },
          env = {
            KIRO_LOG_LEVEL = "info",
          },
        },
      },
    })
  end,
}
