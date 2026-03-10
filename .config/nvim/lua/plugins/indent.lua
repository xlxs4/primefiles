return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    -- opts = { indent = { char = "▏" } },
    opts = {},
    keys = {
        { "<leader>ii", "<cmd>IBLToggle<CR>",      desc = "Indentation Guides Toggle" },
        { "<leader>is", "<cmd>IBLToggleScope<CR>", desc = "Indentation Guides Scope Toggle" },
    }
}

-- Default: `▎` ~
--
-- Alternatives: ~
--   • left aligned solid
--     • `▏`
--     • `▎` (default)
--     • `▍`
--     • `▌`
--     • `▋`
--     • `▊`
--     • `▉`
--     • `█`
--   • center aligned solid
--     • `│`
--     • `┃`
--   • right aligned solid
--     • `▕`
--     • `▐`
--   • center aligned dashed
--     • `╎`
--     • `╏`
--     • `┆`
--     • `┇`
--     • `┊`
--     • `┋`
--   • center aligned double
--     • `║`
