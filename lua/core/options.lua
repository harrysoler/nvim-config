local opt = vim.opt
local cmd = vim.cmd

opt.title = true                    -- Title at the top
opt.pumheight = 10                  -- Popups max height
opt.cmdheight = 0                   -- Command line height
opt.laststatus = 3                  -- Show statusline on last window

cmd('set path+=**')                 -- Search current dir recursively
opt.ignorecase = true               -- Ignore case when searching
opt.smartcase = true                -- Case sensitive when uppercase in search
opt.inccommand = 'split'            -- Preview subtitutions live

opt.syntax = "on"                   -- Syntax highlighting
opt.number = true                   -- Line numbers
opt.termguicolors = true            -- Better colors
opt.mouse = 'a'                     -- Mouse on all modes
opt.scrolloff = 8                   -- Scroll from 8 lines

opt.cursorline = true
opt.cursorlineopt = 'number'

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Display special chars
opt.list = true
opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣'
}

opt.updatetime = 250                -- Less update time

opt.tabstop = 4                     -- Width of tab character
opt.softtabstop = 4                 -- Fine tune amout of whitespaces to add
opt.shiftwidth = 4                  -- whitespaces to add in normal mode
opt.smartindent = true
opt.expandtab = true                -- Tab to spaces
opt.breakindent = true              -- Continue indent

opt.completeopt = {                 -- Completion behavior
    "menuone",
    "noselect"
}

opt.splitbelow = true               -- New window below
opt.splitright = true               -- New window right

opt.undofile = true                 -- Save undo history
cmd('filetype plugin indent on')    -- Filetype events
