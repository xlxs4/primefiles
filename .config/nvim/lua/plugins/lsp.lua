return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    vim.lsp.config('ruff', {
      init_options = {
        settings = {
          lint = {
            enable = false
          }
        }
      }
    })

    vim.lsp.enable({
      "emmylua_ls",
      "clangd",
      "ruff",
      "ty",
      "julials",
    })
  end
}
