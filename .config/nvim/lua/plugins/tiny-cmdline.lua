return {
    "rachartier/tiny-cmdline.nvim",
    -- Also have search ('/', '?') appear in the center
    opts = {
        native_types = {}
    },
    init = function()
        vim.o.cmdheight = 0
    end,
}
