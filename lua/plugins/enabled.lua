return {
  { "OXY2DEV/helpview.nvim" },
  { "OXY2DEV/markview.nvim",
    opts = {
      experimental = {
        check_rtp = false,
      },
    },
  },
  { "danro/rename.vim" },
  { "junegunn/vim-easy-align" },
  { "vim-scripts/bufonly.vim" },
  { "edkolev/tmuxline.vim" },
  -- { "vim-airline/vim-airline", dependencies = { "vim-airline/vim-airline-themes" } },
  { "edkolev/promptline.vim" },
  { "kyoh86/vim-jsonl" },
  { "xolox/vim-session", dependencies = { "xolox/vim-misc" } },
  { "tpope/vim-sensible" },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
  },
  {
    "yetone/avante.nvim",
    build = function()
      if vim.fn.has("win32") == 1 then
        return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      else
        return "make"
      end
    end,
    event = "VeryLazy",
    opts = {
      provider = "ollama",
      providers = {
        ollama = {
          endpoint = "http://127.0.0.1:11434",
          model = "codegemma",
        },
      },
    },
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   opts = {
  --     strategies = {
  --       chat = {
  --         adapter = 'ollama',
  --       },
  --       inline = {
  --         adapter = 'ollama',
  --       },
  --       agent = {
  --         adapter = 'ollama',
  --       },
  --     },
  --     adapters = {
  --       ollama = function()
  --         return require('codecompanion.adapters').extend('ollama', {
  --           name = 'local_ollama',
  --           env = {
  --             url = 'http://localhost:11434',
  --           },
  --           schema = {
  --             model = {
  --               default = 'gemma3:27b',
  --             },
  --           },
  --         })
  --       end,
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },
}
