return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  opts = {
    renderer = {
      icons = {
        show = {
          file = false,
          folder = false,
          folder_arrow = false,
          git = false,
          modified = false,
          diagnostics = false,
          bookmarks = false,
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}
