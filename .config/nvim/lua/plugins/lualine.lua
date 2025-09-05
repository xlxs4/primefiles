return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    theme = "modus-vivendi",
    sections = {
      lualine_x = { "aerial" },
      lualine_y = { "overseer" },
    },
    extensions = {
      "aerial",
      "man",
      "nvim-tree",
      "oil"
    }
  }
}
