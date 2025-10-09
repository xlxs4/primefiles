return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sections = {
      lualine_b = {
        "branch",
        "diagnostics",
      },
      lualine_c = {
        "filename"
      },
      lualine_x = {
        "fileformat",
      },
      lualine_y = {
        "progress",
        "overseer"
      },
    },
    extensions = {
      "man",
      "nvim-tree",
      "oil"
    }
  }
}
