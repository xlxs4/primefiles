return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  config = function(_, opts)
    -- NOTE: `nvim-tree.api` is the public API, other modules are not meant
    -- to be public facing:
    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#caution-api-and-internal-modules
    local api = require("nvim-tree.api")
    -- Refresh nvim-tree upon `auto-session` session restore
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = "NvimTree*",
      callback = function()
        if not api.tree.is_visible() then
          api.tree.open()
        end
      end,

    })
    -- Automatically resize the tree when Neovim window size changes
    vim.api.nvim_create_augroup("NvimTreeResize", {
      clear = true,
    })
    vim.api.nvim_create_autocmd({ "VimResized", "WinResized" }, {
      group = "NvimTreeResize",
      callback = function()
        -- Get the nvim-tree window ID
        local winid = api.tree.winid()
        if (winid) then
          api.tree.reload()
        end
      end
    })
    require("nvim-tree").setup(opts)
  end,
  opts = {
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function edit_or_open()
        local node = api.tree.get_node_under_cursor()
        if node.nodes ~= nil then
          -- Expand or collapse a folder
          api.node.open.edit()
        else
          -- Open file
          api.node.open.edit()
          -- Close the tree if file was opened
          api.tree.close()
        end
      end

      -- Open as vsplit on current mode
      local function vsplit_preview()
        local node = api.tree.get_node_under_cursor()
        if node.nodes ~= nil then
          -- Expand or collapse folder
          api.node.open.edit()
        else
          -- Open file as vsplit
          api.node.open.vertical()
        end
        -- Finally, refocus on tree if focus was lost
        api.tree.focus()
      end

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true
        }
      end

      -- :h nvim-tree-mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Set HJKL bindings in nvim-tree buffer for homerow navigation
      vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
      vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
    end,

    -- opts table
    view = {
      relativenumber = true
    },
    renderer = {
      icons = {
        show = {
          git = false,
          modified = false,
          diagnostics = false,
          bookmarks = false,
        },
      },
    },
  },
  keys = {
    { "<leader>tt", "<cmd>NvimTreeToggle<CR>",   desc = "Tree Toggle" },
    { "<leader>tf", "<cmd>NvimTreeFindFile<CR>", desc = "Tree Find File" },
    { "<leader>tc", "<cmd>NvimTreeCollapse<CR>", desc = "Tree Collapse" },

  }
}
