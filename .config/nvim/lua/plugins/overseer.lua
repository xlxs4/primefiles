return {
    "stevearc/overseer.nvim",
    cmd = {
        "OverseerOpen",
        "OverseerClose",
        "OverseerToggle",
        "OverseerSaveBundle",
        "OverseerLoadBundle",
        "OverseerDeleteBundle",
        "OverseerRunCmd",
        "OverseerRun",
        "OverseerInfo",
        "OverseerBuild",
        "OverseerQuickAction",
        "OverseerTaskAction",
        "OverseerClearCache",
    },
    opts = {
        dap = false,
        templates = {
            "builtin",
            "user.odin_build",
            "user.odin_build_file"
        }
    },
    keys = {
        { "<leader>ow", "<cmd>OverseerToggle<cr>",      desc = "Task list" },
        { "<leader>oo", "<cmd>OverseerRun<cr>",         desc = "Run task" },
        { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
        { "<leader>oi", "<cmd>OverseerInfo<cr>",        desc = "Overseer Info" },
        { "<leader>ob", "<cmd>OverseerBuild<cr>",       desc = "Task builder" },
        { "<leader>ot", "<cmd>OverseerTaskAction<cr>",  desc = "Task action" },
        { "<leader>oc", "<cmd>OverseerClearCache<cr>",  desc = "Clear cache" },
    }
}
