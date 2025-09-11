return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      -- Groups
      { "<leader>d",  group = "dap" },
      { "<leader>f",  group = "find" },
      { "<leader>s",  group = "search" },
      { "<leader>g",  group = "git" },
      { "<leader>l",  group = "lsp" },
      { "<leader>a",  group = "aerial" },
      { "<leader>b",  group = "bufferline" },
      { "<leader>o",  group = "overseer" },
      { "<leader>t",  group = "tree" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
