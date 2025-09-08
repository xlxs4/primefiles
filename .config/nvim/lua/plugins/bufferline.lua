return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
    }
  },
  keys = {
    { "<leader>bp", "<cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },
    { "<S-h>",      "<cmd>BufferLineCyclePrev<CR>",            desc = "Previous Buffer" },
    { "<S-l>",      "<cmd>BufferLineCycleNext<CR>",            desc = "Next Buffer" },
    { "[b",         "<cmd>BufferLineCyclePrev<CR>",            desc = "Previous Buffer" },
    { "]b",         "<cmd>BufferLineCycleNext<CR>",            desc = "Next Buffer" },
    { "[B",         "<cmd>BufferLineMovePrev<CR>",             desc = "Move Previous Buffer" },
    { "]B",         "<cmd>BufferLineMoveNext<CR>",             desc = "Move Next Buffer" },
  }
}
