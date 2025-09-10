return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>jk", "<cmd>wq<CR>",       desc = "Save and Quit" },
      { "<leader>jK", "<cmd>wqa<CR>",      desc = "Save and Quit All" },
      { "<leader>jl", "<cmd>q<CR>",        desc = "Quit" },
      { "<leader>jL", "<cmd>qa<CR>",       desc = "Quit All" },
      { "<leader>j;", "<cmd>bd<CR>",       desc = "Delete buffer" },
      -- Groups
      { "<leader>j",  group = "quick motions" },
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
