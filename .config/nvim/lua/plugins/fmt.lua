return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>;",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { lsp_format = "fallback" },
      julia = { "runic" },
      python = {
        "ruff_fix",
        "ruff_format",
        "ruff_organize_imports"
      },
    },
  }
}
