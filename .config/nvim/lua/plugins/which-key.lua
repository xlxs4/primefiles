return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      -- Groups
      { "<leader>d", group = "dap" },
      { "<leader>e", group = "explorer" },
      { "<leader>f", group = "find" },
      { "<leader>s", group = "search" },
      { "<leader>g", group = "git" },
      { "<leader>l", group = "lsp" },
      { "<leader>k", group = "scope" },
      { "<leader>a", group = "aerial" },
      { "<leader>o", group = "overseer" },
      { "<leader>w", group = "auto-session" },
      { "<leader>b", group = "bufferline" },
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
