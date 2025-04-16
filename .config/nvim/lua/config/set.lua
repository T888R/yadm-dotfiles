-- Makes space the leader
vim.g.mapleader = " "

-- Makes the cursor a blocklilstrudel always
vim.opt.guicursor = "a:block"

-- Enables global clipboard support
vim.opt.clipboard = "unnamedplus"

-- Enables relative line numbers
vim.opt.nu = true
-- vim.opt.relativenumber = true

-- Makes tab width 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Automatically indents
vim.opt.smartindent = true

-- Disable line wrapping
vim.opt.wrap = false

-- Disables swap and backup
vim.opt.swapfile = false
vim.opt.backup = false

-- Enables and configures undofile
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Enables true color support
vim.opt.termguicolors = true

-- Buts a dark line on the 100th character
vim.opt.colorcolumn = "100"

-- Highlights the line the cursor is on
vim.opt.cursorline = true

-- Shorten the wait for the CursorHold event
vim.opt.updatetime = 50

-- Leaves 8 lines above/below cursor while scrolling
vim.opt.scrolloff = 8

-- Makes the sign column always visable
vim.opt.signcolumn = "yes"

-- I have no idea tbh
vim.opt.isfname:append("@-@")

-- Configure username in instant.nvim
vim.g.instant_username = "t8r"

-- Stop netrw from running
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Shows search as you're typing not after
vim.opt.incsearch = true
vim.opt.hlsearch = false
