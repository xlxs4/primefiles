return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    branch = "main",
    opts = {
        select = {
            lookahead = true,
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V',  -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = false,
        },
        move = {
            set_jumps = true,
        }
    },
    keys = {
        -- TODO: Descriptions
        -- Selection
        -- You can use the capture groups defined in `textobjects.scm`
        {
            "af",
            mode = { "x", "o" },
            function()
                require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
            end,
        },
        {
            "if",
            mode = { "x", "o" },
            function()
                require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
            end,
        },
        {
            "ac",
            mode = { "x", "o" },
            function()
                require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
            end,
        },
        {
            "ic",
            mode = { "x", "o" },
            function()
                require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
            end,
        },
        -- Swapping
        {
            "<leader>a",
            function()
                require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
            end,
        },
        {
            "<leader>A",
            function()
                require("nvim-treesitter-textobjects.swap").swap_next "@parameter.outer"
            end,
        },
        -- Moving
        -- You can use captures from other query groups like `locals.scm`
        {
            "as",
            mode = { "x", "o" },
            function()
                require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
            end,
        },
        -- You can use the capture groups defined in `textobjects.scm`
        {
            "]m",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
            end,
        },
        {
            "]]",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
            end,
        },
        -- You can pass a list to group multiple queries
        {
            "]o",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" },
                    "textobjects")
            end,
        },
        -- You can use captures from other query groups like `locals.scm` or `folds.scm`
        {
            "]s",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
            end,
        },
        {
            "]z",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
            end,
        },
        -- `goto_next_end`
        {
            "]M",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
            end,
        },
        {
            "][",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
            end,
        },
        -- `goto_previous_start`
        {
            "[m",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
            end,
        },
        {
            "[[",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
            end,
        },
        -- `goto_previous_end`
        {
            "[M",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
            end,
        },
        {
            "[]",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
            end,
        },
        -- Go to either the start or the end, whichever is closer.
        -- Use if you want more granular movements
        {
            "]d",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
            end,
        },
        {
            "[d",
            mode = { "n", "x", "o" },
            function()
                require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
            end,
        },
        -- Movement repeat
        --
        -- Repeat movement with `;` and `,`.
        -- ensure `;` goes forward and `,` goes backward regardless of the last direction
        -- {
        --     ";",
        --     mode = { "n", "x", "o" },
        --     function()
        --         require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_next()
        --     end,
        -- },
        -- {
        --     ",",
        --     mode = { "n", "x", "o" },
        --     function()
        --         require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_previous()
        --     end,
        -- },
        --
        -- TODO
        -- {
        --     ";",
        --     mode = { "n", "x", "o" },
        --     function()
        --         require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move()
        --     end,
        -- },
        -- {
        --     ",",
        --     mode = { "n", "x", "o" },
        --     function()
        --         require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_opposite()
        --     end,
        -- },
        --
        --
        -- TODO
        -- Optionally, make builtin f, F, t, T also repeatable with `;` and `,`
        -- (see nvim-treesitter/textobjexts README)
    }
}
