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
  --               default = 'codegemma',
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
  {
    name = 'amazonq',
    url = 'https://github.com/awslabs/amazonq.nvim.git',
    enabled = os.getenv("NVIM_PROFILE") == "work",
    opts = {
      ssoStartUrl = 'https://genesys-cloud.awsapps.com/start',
    },
  },
  -- {
  --   "franco-ruggeri/codecompanion-spinner.nvim",
  --   dependencies = {
  --       "olimorris/codecompanion.nvim",
  --       "nvim-lua/plenary.nvim",
  --   },
  --   opts = {}
  -- }
}
