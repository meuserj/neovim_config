return {
  { "OXY2DEV/helpview.nvim" },
  { "OXY2DEV/markview.nvim" },
  { "danro/rename.vim" },
  { "junegunn/vim-easy-align" },
  -- { "tpope/vim-fugitive" },
  { "vim-scripts/bufonly.vim" },
  { "edkolev/tmuxline.vim" },
  { "vim-airline/vim-airline", dependencies = { "vim-airline/vim-airline-themes" } },
  { "edkolev/promptline.vim" },
  { "kyoh86/vim-jsonl" },
  { "xolox/vim-session", dependencies = { "xolox/vim-misc" } },
  { "tpope/vim-sensible" },
  {
    "goolord/alpha-nvim",
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("alpha").setup(require("alpha.themes.theta").config)
    end,
  },
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
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "docs" },
      },
    },
  },
}
