return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = require "configs.mason",
  },

  {
    "b0o/SchemaStore.nvim",
    lazy = false,
    version = false, -- last release is way too old
  },
}
