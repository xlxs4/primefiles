return {
  "rmagatti/auto-session",
  lazy = false,
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    auto_restore = false,
    suppressed_dirs = { "~/", "~/Downloads", "/" },
  },
  keys = {
    { "<leader>w", "<cmd>AutoSession search<CR>", desc = "Session Search" }
  }
}
