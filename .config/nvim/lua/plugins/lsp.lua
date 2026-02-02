return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        vim.lsp.config('ruff', {
            init_options = {
                settings = {
                    lint = {
                        -- Only use ruff as formatter, not as linter
                        enable = false
                    }
                }
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
