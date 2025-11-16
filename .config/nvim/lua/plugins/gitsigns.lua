return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {
            "<leader>jl",
            "<cmd>Gitsigns blame_line<CR>",
            desc = "Show Git Blame for Line"
        },
        {
            "<leader>jp",
            "<cmd>Gitsigns preview_hunk<CR>",
            desc = "Preview Git Hunk"
        },
        {
            "<leader>js",
            "<cmd>Gitsigns state_hunk<CR>",
            desc = "Stage/Unstage Git Hunk"
        },
        {
            "<leader>jr",
            "<cmd>Gitsigns reset_hunk<CR>",
            desc = "Reset Git Hunk"
        },
        {
            "<leader>jj",
            "<cmd>Gitsigns nav_hunk next<CR>",
            desc = "Go to Next Git Hunk"
        },
        {
            "<leader>jk",
            "<cmd>Gitsigns nav_hunk prev<CR>",
            desc = "Go to Previous Git Hunk"
        },
    }
}
