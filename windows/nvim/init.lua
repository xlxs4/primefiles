-- Basic
vim.opt.number = true         -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.scrolloff = 10        -- Maintain 10 lines above/below cursor
vim.opt.sidescrolloff = 8     -- Maintain 10 lines left/right of cursor

-- Indentation
vim.opt.tabstop = 3        -- Tab width
vim.opt.shiftwidth = 3     -- Indent width
vim.opt.softtabstop = 3    -- Soft tab stop
vim.opt.expandtab = false  -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line

-- Search
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true  -- Case sensitive if uppercase in search
vim.opt.hlsearch = false  -- Don't highlight search results
vim.opt.incsearch = true  -- Show matches as you type

-- Visual
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.background = "dark"  -- Background
vim.opt.signcolumn = "yes"   -- Always show sign column
vim.opt.colorcolumn = "100"  -- Show column at 100 characters
vim.opt.showmatch = true     -- Highlight matching brackets
vim.opt.matchtime = 2        -- How long to show matching bracket
vim.opt.wrap = false         -- Soft wrap
vim.opt.linebreak = false    -- Wrap on linebreaks

-- Undofile
vim.opt.undofile = true

-- https://github.com/rmagatti/auto-session?tab=readme-ov-file#recommended-sessionoptions-config
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- More natural split directions
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Auto-resize splits when terminal window changes size
-- (e.g., when splitting or zooming with tmux)
vim.api.nvim_create_autocmd({ "VimResized" }, { pattern = "*", command = "wincmd = " })

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Mappings
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set('n', '<c-u>', '<c-u>zz', { desc = 'Scroll up half screen' })
vim.keymap.set('n', '<c-d>', '<c-d>zz', { desc = 'Scroll down half screen' })

-- Be able to use j and k for vertical movement inside wraps.
-- We're using v:count so that if we just press j, we move down one
-- *visual* line, but if we press, e.g., 5j we move down five *logical* lines
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Faster navigation across windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Fullscreen a single window
vim.keymap.set("n", "<leader>z", function()
  local zoom = vim.t.zoom
  if not zoom then
    -- zoom in: remember the original window, open it in a new tab
    local win = vim.api.nvim_get_current_win()
    vim.cmd("tab split")
    vim.t.zoom = { win = win }
    return
  end

  -- zoom out: carry buffer + cursor/scroll position back to the original window
  local buf = vim.api.nvim_get_current_buf()
  local view = vim.fn.winsaveview()
  if not pcall(vim.cmd, "tabclose") then
    vim.t.zoom = nil -- it was the last tab; just stop treating it as a zoom
    return
  end
  if vim.api.nvim_win_is_valid(zoom.win) then
    vim.api.nvim_set_current_win(zoom.win) -- window ids are global, so this also switches tab
    vim.api.nvim_win_set_buf(zoom.win, buf)
    vim.fn.winrestview(view)
  end
end, { desc = "Toggle zoom" })

--- Plugins
vim.g.qs_highlight_on_keys = { "f", "F" } -- for quick-scope
vim.pack.add({
	"https://github.com/p00f/alabaster.nvim",
	"https://github.com/rachartier/tiny-cmdline.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/unblevable/quick-scope",
	"https://github.com/folke/which-key.nvim",
})

--- alabaster
vim.cmd.colorscheme("alabaster")

--- tiny-cmdline
-- Enable the *experimental* TUI for messages
-- https://github.com/neovim/neovim/pull/27855
-- Renamed from _extui to _core.ui2 in
-- https://github.com/neovim/neovim/commit/bf68ba40a03a19c97454ede293ed289c547b5aaa
require("vim._core.ui2").enable({})
vim.o.cmdheight = 0

--- oil
require("oil").setup({
	columns = {},
	view_options = { show_hidden = true },
	skip_confirm_for_simple_edits = true,
})
vim.keymap.set("n", "<leader>O", "<cmd>Oil<CR>", { desc = "Oil" })

--- fzf-lua
require("fzf-lua").setup({
  "hide", -- profile
  fzf_opts = { ["--cycle"] = true },
  defaults = {
    -- Disable all icons across pickers. The defaults table
    -- (or function) is for "global-picker" defaults
    git_icons = false,
    file_icons = false,
    color_icons = false,
  },
  oldfiles = {
    -- Include buffers visited in the current session.
    -- This is handy for using oldfiles to switch between
    -- commonly used files
    include_current_session = true,
  },
  previewers = {
    builtin = {
      -- Ensure that the previewer won't add syntax highlighting
      -- to files larger than 100KB
      syntax_limit_b = 1024 * 100, -- 100 KB
    },
  },
})

-- find
vim.keymap.set("n", "<leader>fq",  "<cmd>FzfLua quickfix<CR>",              { desc = "Quickfix" })
vim.keymap.set("n", "<leader>fl",  "<cmd>FzfLua loclist<CR>",               { desc = "Loclist" })
vim.keymap.set("n", "<leader>fdd", "<cmd>FzfLua diagnostics_document<CR>",  { desc = "Find Diagnostics (Buffer)" })
vim.keymap.set("n", "<leader>fdw", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "Find Diagnostics" })
vim.keymap.set("n", "<leader>fb",  "<cmd>FzfLua buffers<CR>",               { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fw",  "<cmd>FzfLua grep_cword<CR>",            { desc = "Find Current Word" })
vim.keymap.set({ "n", "o", "x" },
                    "<leader>fv",  "<cmd>FzfLua grep_visual<CR>",           { desc = "Find Selection" })
vim.keymap.set("n", "<leader>ftg", "<cmd>FzfLua tags<CR>",                  { desc = "Find Tags" })
vim.keymap.set("n", "<leader>fta", "<cmd>FzfLua tabs<CR>",                  { desc = "Find Tabs" })
vim.keymap.set("n", "<leader>fts", "<cmd>FzfLua tagstack<CR>",              { desc = "Tagstack" })
vim.keymap.set("n", "<leader>ff",  "<cmd>FzfLua files<CR>",                 { desc = "Find Files" })
vim.keymap.set("n", "<leader>fo",  "<cmd>FzfLua oldfiles<CR>",              { desc = "Recent" })
vim.keymap.set("n", "<leader>fp",  "<cmd>FzfLua global<CR>",                { desc = "Fuzzy Find Global" })
vim.keymap.set("n", "<leader>fj",  "<cmd>FzfLua jumps<CR>",                 { desc = "Jump List" })
vim.keymap.set("n", "<leader>fm",  "<cmd>FzfLua marks<CR>",                 { desc = "Marks" })
vim.keymap.set("n", "<leader>fc",  "<cmd>FzfLua changes<CR>",               { desc = "Changes" })
vim.keymap.set("n", "<leader>fu",  "<cmd>FzfLua undotree<CR>",              { desc = "History Undo Tree" })

-- search
vim.keymap.set("n", "<leader>sl",  "<cmd>FzfLua builtin<CR>",               { desc = "Fuzzy Find Commands" })
vim.keymap.set("n", "<leader>sr",  "<cmd>FzfLua resume<CR>",                { desc = "Fuzzy Find Resume" })
vim.keymap.set("n", "<leader>sg",  "<cmd>FzfLua live_grep_native<CR>",      { desc = "Grep" })
vim.keymap.set("n", "<leader>s/",  "<cmd>FzfLua blines<CR>",                { desc = "Fuzzy Find Buffer Lines" })
vim.keymap.set("n", "<leader>sh",  "<cmd>FzfLua helptags<CR>",              { desc = "Help Tags" })
vim.keymap.set("n", "<leader>sm",  "<cmd>FzfLua manpages<CR>",              { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sc",  "<cmd>FzfLua command_history<CR>",       { desc = "Command History" })
 
-- git
vim.keymap.set("n", "<leader>gf",  "<cmd>FzfLua git_files<CR>",             { desc = "Git Files" })
vim.keymap.set("n", "<leader>gs",  "<cmd>FzfLua git_status<CR>",            { desc = "Git Status" })
vim.keymap.set("n", "<leader>gd",  "<cmd>FzfLua git_diff<CR>",              { desc = "Git Diff" })
vim.keymap.set("n", "<leader>gc",  "<cmd>FzfLua git_commits<CR>",           { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gh",  "<cmd>FzfLua git_hunks<CR>",             { desc = "Git Hunks" })
vim.keymap.set("n", "<leader>gbc", "<cmd>FzfLua git_bcommits<CR>",          { desc = "Git Commits (Buffer)" })
vim.keymap.set("n", "<leader>gbl", "<cmd>FzfLua git_blame<CR>",             { desc = "Git Blame (Buffer)" })
vim.keymap.set("n", "<leader>gbb", "<cmd>FzfLua git_branches<CR>",          { desc = "Git Branches" })

--- which-key
require("which-key").setup({
  preset = "modern",
  icons = {
	  mappings = false,
	  keys = {
	  Up = "Up",
	  Down = "Down",
	  Left = "Left",
	  Right = "Right",
	  C = "C",
	  M = "M",
     D = "D",
	  S = "S",
	  CR = "CR",
	  Esc = "Esc",
	  ScrollWheelDown = "ScrlUp",
	  ScrollWheelUp = "ScrlDown",
	  NL = "NL",
	  BS = "BS",
	  Space = "Space",
	  Tab = "Tab",
	  F1 = "F1",
	  F2 = "F2",
	  F3 = "F3",
	  F4 = "F4",
	  F5 = "F5",
	  F6 = "F6",
	  F7 = "F7",
	  F8 = "F8",
	  F9 = "F9",
	  F10 = "F10",
	  F11 = "F11",
	  F12 = "F12",
	 },
  },
  spec = {
    -- Groups
    { "<leader>f", group = "find" },
    { "<leader>s", group = "search" },
    { "<leader>g", group = "git" },
  },
})

