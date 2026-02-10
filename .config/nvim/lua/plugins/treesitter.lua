return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ':TSUpdate',
    opts = function()
        require("nvim-treesitter").install({
            "julia",
            "python",
            "rust",
            "odin",
            "cpp",
            "typst",
            "regex", -- For noice.nvim cmdline highlighting
            "bash",  -- For noice.nvim cmdline highlighting
        })
    end,
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "julia",
                "python",
                "rust",
                "odin",
                "cpp",
                "typst",
            },
            callback = function()
                vim.treesitter.start()
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
