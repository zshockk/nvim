pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  ensure_installed = {
    "bash",
    "xml",
    "html",
    "css",
    "javascript",
    "dockerfile",
    "yaml",
    "toml",
    "go",
    "gomod",
    "gosum",
    "gotmpl",
    "gowork",
    "jsdoc",
    "json",
    "jsonc",
    "json5",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "python",
    "regex",
    "vim",
    "vimdoc",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}
