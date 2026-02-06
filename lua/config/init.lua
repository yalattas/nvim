-- General configuration and settings

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
-- vim.cmd([[syntax on]])

-- Use system clipboard for yank and paste operations
vim.opt.clipboard = "unnamed,unnamedplus"

-- Indentation settings: use spaces instead of tabs
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.shiftwidth = 2        -- Number of spaces for indentation
vim.opt.tabstop = 2           -- Number of spaces that a tab counts for
vim.opt.softtabstop = 2       -- Number of spaces for tab in insert mode
vim.opt.smartindent = true    -- Smart autoindenting on new lines
