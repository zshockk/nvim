local gitsigns_config = require "configs.gitsigns"
local snacks_config = require "configs.snacks"
local which_key_config = require "configs.which_key"

return {
  -- git signs highlights text that has changed since the list
  -- git commit, and also lets you interactively stage & unstage
  -- hunks in a commit.
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = gitsigns_config.opts,
  },
  {
    "gitsigns.nvim",
    opts = gitsigns_config.ui_opts,
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = snacks_config.opts,
    keys = snacks_config.keys,
    init = snacks_config.init,
  },

  {
    "gbprod/yanky.nvim",
    lazy = false,
    recommended = true,
    desc = "Better Yank/Paste",
    opts = require "configs.yanky",
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "folke/which-key.nvim",
    lazy = false,
    opts_extend = { "spec" },
    opts = which_key_config.opts,
    keys = which_key_config.keys,
  },
}
