return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  version = false,
  build = ':TSUpdate',
  opts = {
    -- ensure_installed = {
    --   "c",
    --   "lua",
    --   "vim",
    --   "vimdoc",
    --   "markdown",
    --   "markdown_inline",
    --   "diff",
    --   "julia",
    --   "python",
    -- },
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
    },
    indent = { enable = true },
  },
}
