return {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "ibhagwan/fzf-lua"
    },
    cmd = "Neogit",
    keys = {
        {
            "<leader>gg",
            function() require("neogit").open({ kind = "auto" }) end,
            desc = "Show Neogit UI"
        }
    }
}
