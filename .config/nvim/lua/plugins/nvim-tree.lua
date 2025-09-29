return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  version = "*",
  lazy = false,
  opts = {
    view = {
      float = {
        enable = true,
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = screen_w * 0.5
          local window_h = screen_h * 0.8
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = (screen_w - window_w) / 2
          local center_y = ((vim.opt.lines:get() - window_h) / 2)
              - vim.opt.cmdheight:get()
          return {
            border = 'rounded',
            relative = 'editor',
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
          }
        end
      }
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function edit_or_open()
        local node = api.tree.get_node_under_cursor()
        if node.nodes ~= nil then
          api.node.open.edit()
        else
          api.node.open.edit()
          api.tree.close()
        end
      end

      local function vsplit_preview()
        local node = api.tree.get_node_under_cursor()
        if node.nodes ~= nil then
          api.node.open.edit()
        else
          api.node.open.vertical()
        end
        api.tree.focus()
      end

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
      vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
    end,
  },
  keys = {
    { "<leader>tt", "<cmd>NvimTreeToggle<CR>",   desc = "Tree Toggle" },
    { "<leader>tf", "<cmd>NvimTreeFindFile<CR>", desc = "Tree Find File" },
    { "<leader>tc", "<cmd>NvimTreeCollapse<CR>", desc = "Tree Collapse" },
  }
}
