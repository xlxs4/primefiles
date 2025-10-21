return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>;",
            function()
                require("conform").format()
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        default_format_opts = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
            lsp_format = "fallback",
        },
        formatters = {
            odinfmt = {
                command = "odinfmt",
                args = { "-stdin" },
                stdin = true,
            },
        },
        formatters_by_ft = {
            julia = { "runic" },
            python = {
                "ruff_fix",
                "ruff_format",
                "ruff_organize_imports"
            },
            odin = { "odinfmt" },
        },
    }
}
