-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.uv).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Basic
vim.opt.number = true         -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.scrolloff = 10        -- Maintain 10 lines above/below cursor
vim.opt.sidescrolloff = 8     -- Maintain 10 lines left/right of cursor

-- Indentation
vim.opt.tabstop = 4        -- Tab width
vim.opt.shiftwidth = 4     -- Indent width
vim.opt.softtabstop = 4    -- Soft tab stop
vim.opt.expandtab = true   -- Use spaces instead of tabs
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
vim.opt.cmdheight = 1        -- Command line height
vim.opt.wrap = false         -- Soft wrap
vim.opt.linebreak = false    -- Wrap on linebreaks
vim.opt.listchars = {
    tab = "→ ",
    extends = "›",
    precedes = "‹",
    nbsp = "␣",
    trail = "·"
}
vim.opt.list = true


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

vim.keymap.set(
    'n',
    '<leader>W',
    function()
        local is_on = vim.opt.wrap:get()
        if not is_on then
            vim.opt.wrap = true
            vim.opt.linebreak = true
            vim.opt.list = false
        else
            vim.opt.wrap = false
            vim.opt.linebreak = false
            vim.opt.list = true
        end
    end,
    { desc = 'Toggle Prose' }
)

-- Enable the *experimental* TUI for messages
-- https://github.com/neovim/neovim/pull/27855
-- Renamed from _extui to _core.ui2 in
-- https://github.com/neovim/neovim/commit/bf68ba40a03a19c97454ede293ed289c547b5aaa
require('vim._core.ui2').enable({})

require("lazy").setup({
    spec = {
        { import = "plugins" },

    },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
