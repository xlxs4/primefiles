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
    { "<leader>wr", "<cmd>AutoSession restore<CR>",       desc = "Session Restore" },
    { "<leader>wf", "<cmd>AutoSession search<CR>",        desc = "Session Search" },
    { "<leader>ws", "<cmd>AutoSession save<CR>",          desc = "Session Save" },
    { "<leader>wt", "<cmd>AutoSession toggle<CR>",        desc = "Session Toggle" },
    { "<leader>wd", "<cmd>AutoSession deletePicker<CR>",  desc = "Session Search (Delete)" },
    { "<leader>wp", "<cmd>AutoSession purgeOrphaned<CR>", desc = "Session Purge Orphaned" },
  }
}
