return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
    keys = {
        {
            "<leader>er",
            "<cmd>TSContext toggle<CR>",
            desc = "Toggle Treesitter Context"
        }
    }
}
