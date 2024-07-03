-- list of parsers: https://github.com/nvim-treesitter/nvim-treesitter/wiki/List-of-parsers

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
    "lua", 
    "rust", 
    "vim", 
    "html", 
    "python",
    "regex",
    "sql",
    "typescript",
    "yaml",
    "json",
    "javascript"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

