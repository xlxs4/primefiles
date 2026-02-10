return {
    "smjonas/inc-rename.nvim",
    opts = {},
    cmd = "IncRename",
    keys = {
        {
            "<leader>rr",
            ":IncRename ",
            desc = "LSP Incremental Rename"
        },
        {
            "<leader>re",
            function() return ":IncRename " .. vim.fn.expand("<cword>") end,
            desc = "LSP Incremental Rename (Current Word)",
            expr = true
        },
    }
}
