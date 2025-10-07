return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  init = function()
    -- debug
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        local Snacks = require "snacks"
        vim.api.nvim_create_user_command("BD", function()
          Snacks.bufdelete()
        end, {})
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        if vim.fn.has("nvim-0.11") == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = dd
        end
      end
    })
  end,
  opts = {
    animate = {},
    bigfile = {},
    bufdelete = {},
    debug = {},
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore session", action = ":AutoSession restore" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        }
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
    explorer = {
      replace_netrw = true
    },
    input = {},
    layout = {},
    gitbrowse = {},
    quickfile = {},
    scope = {},
    statuscolumn = {},
    zen = {},
  },
  keys = {
    -- explorer
    { "<leader>ee", ":lua Snacks.explorer()<CR>",        desc = "Explorer" },
    { "<leader>er", ":lua Snacks.explorer.reveal()<CR>", desc = "Reveal in Explorer" },
    -- gitbrowse
    { "<leader>go", ":lua Snacks.gitbrowse()<CR>",       desc = "Open Repo in Browser (Buffer)" },
    -- scope
    {
      "<leader>kk",
      mode = { "n", "o", "x" },
      ":lua Snacks.scope.textobject()<CR>",
      desc = "Scope Select"
    },
    { "<leader>kj", ":lua Snacks.scope.jump()<CR>", desc = "Scope Jump" },
    -- zen
    { "<leader>z",  ":lua Snacks.zen.zoom()<CR>",   desc = "Fullscreen" }
  }
}
