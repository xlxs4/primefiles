return {
    "saghen/blink.cmp",
    version = "1.*",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },
        cmdline = {
            enabled = false,
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                },
            },
        },
        keymap = {
            preset = "default",
            ["<C-o>"] = { "show" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-l>"] = { "select_and_accept" },
            ["<C-h>"] = { "hide" },
            ["<Up>"] = false,
            ["<Down>"] = false,
            ["<C-y>"] = false,
            ["<C-e>"] = false,
            ["<C-space>"] = false
        },
    },
}
