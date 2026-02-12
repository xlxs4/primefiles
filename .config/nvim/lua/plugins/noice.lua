return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        cmdline = {
            format = {
                cmdline = {
                    icon = " 󱡄 "
                }
            }
        },
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            }
        },
        presets = {
            -- Add a border to hover docs and signature help
            lsp_doc_border = true,
            -- Enable an input dialog for inc-rename.nvim
            inc_rename = true
        }
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        {
            "rcarriga/nvim-notify",
            config = function()
                ---@type notify.Config
                local conf = {
                    -- No icons
                    icons = {
                        DEBUG = "",
                        ERROR = "",
                        INFO = "",
                        TRACE = "",
                        WARN = "",
                    },
                    stages = "static", -- no animations
                    timeout = 2300,    -- in ms
                }
                require("notify").setup(conf)
            end
        }
    }
}
