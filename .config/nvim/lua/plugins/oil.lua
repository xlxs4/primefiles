return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    { "<leader>o", "<cmd>Oil<CR>", desc = "Buffer-like Explorer (oil)" },
  },
}
