require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "javascript",
    "typescript",
    "c",
    "lua",
    "rust",
    "html",
    "json",
    "css",
    "java",
    "go",
    "markdown",
    "vimdoc",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})

require('nvim-ts-autotag').setup({
  enable_rename = true,
  enable_close = true,
  enable_close_on_slash = true,
})
