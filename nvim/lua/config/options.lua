local opt = vim.opt

-- Line numbers
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative line numbers

-- Tabs & Indentation
opt.tabstop = 2          -- 2 spaces for tabs
opt.shiftwidth = 2       -- 2 spaces for indent width
opt.expandtab = true     -- Expand tabs to spaces
opt.autoindent = true    -- Copy indent from current line when starting new one

-- Line wrapping
opt.wrap = false         -- Disable line wrapping

-- Search settings
opt.ignorecase = true    -- Ignore case when searching
opt.smartcase = true     -- If you include mixed case in your search, assumes you want case-sensitive

-- Cursor line
opt.cursorline = true    -- Highlight the current cursor line

-- Appearance
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.signcolumn = "yes"   -- Show sign column

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard

-- Split windows
opt.splitright = true    -- Split vertical window to the right
opt.splitbelow = true    -- Split horizontal window to the bottom

-- Others
opt.iskeyword:append("-") -- Consider string-string as whole word
opt.modifiable = true     -- Enable buffer modifiable
opt.encoding = "utf-8"    -- String encoding to use
opt.fileencoding = "utf-8"-- File encoding to use
