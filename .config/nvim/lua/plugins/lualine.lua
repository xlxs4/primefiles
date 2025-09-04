return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    theme = "modus-vivendi",
    sections = {
      lualine_x = { "aerial" },
    },
    extensions = {
      "aerial",
      "man",
      "nvim-tree",
      "oil"
    }
  }
}
