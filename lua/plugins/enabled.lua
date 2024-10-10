return {
  { "OXY2DEV/helpview.nvim" },
  { "OXY2DEV/markview.nvim" },
  { "danro/rename.vim" },
  { "junegunn/vim-easy-align" },
  { "tpope/vim-fugitive" },
  { "vim-scripts/bufonly.vim" },
  { "edkolev/tmuxline.vim" },
  { "vim-airline/vim-airline", dependencies = { "vim-airline/vim-airline-themes" } },
  { "edkolev/promptline.vim" },
  { "xolox/vim-session", dependencies = { "xolox/vim-misc" } },
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
}
