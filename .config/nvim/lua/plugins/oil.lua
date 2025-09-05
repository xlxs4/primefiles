return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  lazy = false,
  opts = {
    columns = { },
    view_options = {
      show_hidden = true,
    },
    skip_confirm_for_simple_edits = true,
  },
  keys = {
    { "<leader>O", "<cmd>Oil<CR>", desc = "Buffer-like Explorer (oil)" },
  },
}
