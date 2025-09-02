return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  version = false,
  build = ':TSUpdate',
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "c",
      "diff",
      "julia",
      "lua",
      "python",
    },
    incremental_selection = {
      enable = true,
    },
  },
}
