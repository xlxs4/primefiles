return {
  "echasnovski/mini.files",
  version = false,
  lazy = false,
  opts = {
    content = {
      prefix = function() end
    },
  },
  config = function(_, opts)
   require("mini.files").setup(opts)
  end,
}
