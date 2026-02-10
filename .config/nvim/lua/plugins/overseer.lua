return {
    "stevearc/overseer.nvim",
    opts = {
        dap = false,
        templates = {
            "builtin",
            "user.odin_build",
            "user.odin_build_file"
        }
    },
    keys = {
        { "<leader>oo", "<cmd>OverseerToggle<cr>", desc = "Task List" },
        { "<leader>ow", "<cmd>OverseerRun<cr>",    desc = "Run Task" },
        { "<leader>oe", "<cmd>OverseerShell<cr>",  desc = "Create + Run Shell Command" },
        { "<leader>or", "<cmd>OverseerShell!<cr>", desc = "Create Shell Command Task" },
    }
}
