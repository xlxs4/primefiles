-- Basic settings
vim.opt.number = true  		      -- Line numbers
vim.opt.relativenumber = true     -- Relative line numbers
vim.opt.cursorline = true         -- Highlight current line
vim.opt.scrolloff = 10            -- Maintain 10 lines above/below cursor
vim.opt.sidescrolloff = 8         -- Maintain 10 lines left/right of cursor

-- Indentation
vim.opt.tabstop = 4               -- Tab width
vim.opt.shiftwidth = 4            -- Indent width
vim.opt.softtabstop = 4           -- Soft tab stop
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.smartindent = true        -- Smart auto-indenting
vim.opt.autoindent = true         -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true         -- Case insensitive search
vim.opt.smartcase = true          -- Case sensitive if uppercase in search
vim.opt.hlsearch = false          -- Don't highlight search results 
vim.opt.incsearch = true          -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true      -- Enable 24-bit colors
vim.opt.background = "dark"       -- Background
vim.opt.signcolumn = "yes"        -- Always show sign column
vim.opt.colorcolumn = "100"       -- Show column at 100 characters
vim.opt.showmatch = true          -- Highlight matching brackets
vim.opt.matchtime = 2             -- How long to show matching bracket
vim.opt.cmdheight = 1             -- Command line height

local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('junegunn/fzf', { ['do'] = function ()
  vim.fn['fzf#install']()
end })
Plug('junegunn/fzf.vim')

Plug('miikanissi/modus-themes.nvim')

vim.call('plug#end')

-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
vim.cmd('silent! colorscheme modus')

