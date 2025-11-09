local map = vim.keymap.set
local vscode = require "vscode"

vim.g.snacks_animate = false
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"

map("n", "<S-Tab>", function()
  vscode.action "workbench.action.previousEditor"
end, { desc = "Previous buffer" })

map("n", "<Tab>", function()
  vscode.action "workbench.action.nextEditor"
end, { desc = "Next buffer" })

require("lazy").setup {
  {
    "gbprod/yanky.nvim",
    vscode = true,
    lazy = false,
    opts = {
      highlight = { timer = 150 },
    },
  },
}
