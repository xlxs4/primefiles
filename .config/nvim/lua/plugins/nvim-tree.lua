return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
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
  keys = {
    { "<leader>tt", "<cmd>NvimTreeToggle<CR>", desc = "Tree Toggle" },
    { "<leader>tf", "<cmd>NvimTreeFindFile<CR>", desc = "Tree Find File" },
    { "<leader>tc", "<cmd>NvimTreeCollapse<CR>", desc = "Tree Collapse" },
  }
}
