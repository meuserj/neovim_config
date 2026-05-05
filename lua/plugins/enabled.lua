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
}
