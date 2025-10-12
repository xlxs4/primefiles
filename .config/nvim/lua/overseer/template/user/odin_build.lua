return {
  name = "odin build",
  builder = function()
    return {
      cmd = { "odin", "run", "." },
      args = { "-vet", "-strict-style" },
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
