return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = {
    "hide",
  },
  keys = {
    -- find
    { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Find Buffers" },
    { "<leader>ft", "<cmd>FzfLua tabs<CR>", desc = "Find Tabs" },
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find Files" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "Recent" },
    -- search
    { "<leader>sb", "<cmd>FzfLua builtin<CR>", desc = "Fuzzy Find Commands" },
    { "<leader>sr", "<cmd>FzfLua resume<CR>", desc = "Fuzzy Find Resume" },
    { "<leader>sg", "<cmd>FzfLua live_grep_native<CR>", desc = "Grep" },
    { "<leader>s/", "<cmd>FzfLua blines<CR>", desc = "Fuzzy Find Buffer Lines" },
    { "<leader>sh", "<cmd>FzfLua helptags<CR>", desc = "Help Tags" },
    { "<leader>sm", "<cmd>FzfLua manpages<CR>", desc = "Man Pages" },
    { "<leader>sc", "<cmd>FzfLua command_history<CR>", desc = "Command History" },
    -- git
    { "<leader>gf", "<cmd>FzfLua git_files<CR>", desc = "Git Files" },
    { "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Git Status" },
    { "<leader>gd", "<cmd>FzfLua git_diff<CR>", desc = "Git Diff" },
    { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Git Commits" },
    { "<leader>gbc", "<cmd>FzfLua git_bcommits<CR>", desc = "Git Commits (Buffer)" },
    { "<leader>gbl", "<cmd>FzfLua git_blame<CR>", desc = "Git Blame (Buffer)" },
    { "<leader>gbb", "<cmd>FzfLua git_branches<CR>", desc = "Git Branches" },
  },
}
