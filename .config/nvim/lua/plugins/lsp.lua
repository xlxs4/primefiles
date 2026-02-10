return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        vim.lsp.config("ruff", {
            init_options = {
                settings = {
                    lint = {
                        -- Only use ruff as formatter, not as linter
                        enable = false
                    }
                }
            }
        })

        -- Configure tinymist to also use it as a formatter
        -- https://myriad-dreamin.github.io/tinymist/frontend/neovim.html#label-Formatting
        vim.lsp.config("tinymist", {
            settings = {
                -- The alternative, typstfmt, is deprecated in favor of typstyle
                formatterMode = "typstyle",
                formatterPrintWidth = 80,
            }
        })


        vim.lsp.enable({
            -- Lua
            "emmylua_ls",
            -- C/C++
            "clangd",
            -- Python
            "ruff", -- linter, code formatter
            "ty",   -- type checker, LSP
            -- Julia
            "julials",
            -- Odin
            "ols",
            -- Typst
            "tinymist",
        })
    end
}
