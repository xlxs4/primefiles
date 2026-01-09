return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = "FzfLua",
    opts = {
        "hide",
        fzf_opts = { ["--cycle"] = true },
        winopts = {
            preview = { default = "bat_native" }
        }
    },
    keys = {
        -- find
        { "<leader>fdd", "<cmd>FzfLua diagnostics_document<CR>",  desc = "Find Diagnostics (Buffer)" },
        { "<leader>fdw", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "Find Diagnostics" },
        { "<leader>fb",  "<cmd>FzfLua buffers<CR>",               desc = "Find Buffers" },
        { "<leader>fc",  "<cmd>FzfLua grep_cword<CR>",            desc = "Find Current Word" },
        {
            "<leader>fv",
            mode = { "n", "o", "x" },
            "<cmd>FzfLua grep_visual<CR>",
            desc = "Find Selection"
        },
        { "<leader>ftg", "<cmd>FzfLua tags<CR>",                 desc = "Find Tags" },
        { "<leader>fta", "<cmd>FzfLua tabs<CR>",                 desc = "Find Tabs" },
        { "<leader>ff",  "<cmd>FzfLua files<CR>",                desc = "Find Files" },
        { "<leader>fo",  "<cmd>FzfLua oldfiles<CR>",             desc = "Recent" },
        { "<leader>fp",  "<cmd>FzfLua global<CR>",               desc = "Fuzzy Find Global" },
        -- search
        { "<leader>sb",  "<cmd>FzfLua builtin<CR>",              desc = "Fuzzy Find Commands" },
        { "<leader>sr",  "<cmd>FzfLua resume<CR>",               desc = "Fuzzy Find Resume" },
        { "<leader>sg",  "<cmd>FzfLua live_grep_native<CR>",     desc = "Grep" },
        { "<leader>s/",  "<cmd>FzfLua blines<CR>",               desc = "Fuzzy Find Buffer Lines" },
        { "<leader>sh",  "<cmd>FzfLua helptags<CR>",             desc = "Help Tags" },
        { "<leader>sm",  "<cmd>FzfLua manpages<CR>",             desc = "Man Pages" },
        { "<leader>sc",  "<cmd>FzfLua command_history<CR>",      desc = "Command History" },
        { "<leader>st",  "<cmd>FzfLua tagstack<CR>",             desc = "Tagstack" },
        { "<leader>sj",  "<cmd>FzfLua jumps<CR>",                desc = "Jump List" },
        -- git
        { "<leader>gf",  "<cmd>FzfLua git_files<CR>",            desc = "Git Files" },
        { "<leader>gs",  "<cmd>FzfLua git_status<CR>",           desc = "Git Status" },
        { "<leader>gd",  "<cmd>FzfLua git_diff<CR>",             desc = "Git Diff" },
        { "<leader>gc",  "<cmd>FzfLua git_commits<CR>",          desc = "Git Commits" },
        { "<leader>gc",  "<cmd>FzfLua git_hunks<CR>",            desc = "Git Hunks" },
        { "<leader>gbc", "<cmd>FzfLua git_bcommits<CR>",         desc = "Git Commits (Buffer)" },
        { "<leader>gbl", "<cmd>FzfLua git_blame<CR>",            desc = "Git Blame (Buffer)" },
        { "<leader>gbb", "<cmd>FzfLua git_branches<CR>",         desc = "Git Branches" },
        -- LSP
        { "<leader>ls",  "<cmd>FzfLua lsp_document_symbols<CR>", desc = "LSP Symbols (Buffer)" },
        {
            "<leader>lS",
            "<cmd>FzfLua lsp_live_workspace_symbols<CR>",
            desc = "LSP Symbols (Project)"
        },
        {
            "<leader>ll",
            function() require("aerial").fzf_lua_picker() end,
            desc = "LSP Symbols (Aerial)"
        },
        {
            "<leader>ld",
            "<cmd>FzfLua lsp_document_diagnostics<CR>",
            desc = "LSP Diagnostics (Buffer)"
        },
        {
            "<leader>ld",
            "<cmd>FzfLua lsp_workspace_diagnostics<CR>",
            desc = "LSP Diagnostics (Project)"
        },
        {
            "<leader>lr",
            "<cmd>FzfLua lsp_references jump1=true ignore_current_line=true<CR>",
            desc = "LSP References"
        },
        {
            "<leader>lf",
            "<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<CR>",
            desc = "LSP Definitions"
        },
        {
            "<leader>lc",
            "<cmd>FzfLua lsp_declarations jump1=true ignore_current_line=true<CR>",
            desc = "LSP Declarations"
        },
        {
            "<leader>lt",
            "<cmd>FzfLua lsp_typedefs jump1=true ignore_current_line=true<CR>",
            desc = "LSP Type Definitions"
        },
        {
            "<leader>li",
            "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<CR>",
            desc = "LSP Implementations"
        },
    },
}
