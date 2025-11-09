require "utils.vscode.mappings"

local lazy_config = require "configs.lazy"

vim.g.snacks_animate = false
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"

lazy_config.checker = { enabled = false }
lazy_config.change_detection = { enabled = false }

local enabled_plugins = {
  "lazy.nvim",
  "yanky.nvim",
  "nvim-treesitter",
  "vim-repeat",
}

lazy_config.defaults = lazy_config.defaults or {}
lazy_config.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled_plugins, plugin.name) or plugin.vscode
end

require("lazy").setup({
  {
    "gbprod/yanky.nvim",
    vscode = true,
    lazy = false,
    opts = {
      highlight = { timer = 150 },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    vscode = true,
    build = ":TSUpdate",
    opts = {
      highlight = { enable = false },
      incremental_selection = { enable = false },
    },
  },
  {
    "tpope/vim-repeat",
    vscode = true,
    event = "VeryLazy",
  },
}, lazy_config)
