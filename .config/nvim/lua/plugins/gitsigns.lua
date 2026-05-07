local function quickfix_fzf()
    require "gitsigns".setqflist("all", { open = false }, function()
        require "fzf-lua".quickfix()
    end)
end

local function quickfix_attached_fzf()
    require "gitsigns".setqflist("attached", { open = false }, function()
        require "fzf-lua".quickfix()
    end)
end

local function loclist_fzf()
    -- gitsigns also offers setloclist, but that doesn't have an `open?` option for some reason,
    -- so we use setqflist. We pipe the current buffer hunks to the location list,
    -- and the attached/project wide hunks to the quickfix list, because the loclist is
    -- better suited for buffer/window-specific content, while the quickfix list is better
    -- suited for data spanning across many files
    require "gitsigns".setqflist(0, { open = false, use_location_list = true }, function()
        require "fzf-lua".loclist()
    end)
end

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {
            "<leader>jl",
            loclist_fzf,
            desc = "Browse Hunks in Loclist (Buffer)"
        },
        {
            "<leader>jq",
            quickfix_fzf,
            desc = "Browse Hunks in Quickfix (Project)"
        },
        {
            "<leader>ja",
            quickfix_attached_fzf,
            desc = "Browse Hunks in Quickfix (Attached)"
        },
        {
            "<leader>ji",
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
