return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    terminal = { enabled = true },
  },
  keys = {
    { "<leader>;", function() Snacks.terminal() end, desc = "Terminal Toggle" },
    { "<c-j>;", "<cmd>close<cr>", mode = "t", desc = "Terminal Toggle" },
  },
}
