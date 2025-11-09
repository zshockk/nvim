return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "L3MON4D3/LuaSnip",
    lazy = false,
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = false,
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = require "configs.lint",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
  },
}
