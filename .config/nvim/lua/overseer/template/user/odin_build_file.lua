return {
  name = "odin build file",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    return {
      cmd = { "odin", "run", file },
      args = { "-file", "-vet", "-strict-style" },
      components = {
        {
          "on_output_quickfix",
          open = true
        },
        "default"
      },
    }
  end,
  condition = {
    filetype = { "odin" }
  },
}
