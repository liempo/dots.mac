-- Set encoding to utf-8
vim.o.encoding = "utf-8"

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Replace escape with jj
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', 'jj', '<Esc>', { noremap = true, silent = true })

-- Disable arrow keys
vim.api.nvim_set_keymap('n', '<Left>', [[:echoe "Use 'h'"<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', [[:echoe "Use 'l'"<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', [[:echoe "Use 'k'"<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', [[:echoe "Use 'j'"<CR>]], { noremap = true, silent = true })

-- Set space as the leader key
vim.g.mapleader = ' '

-- Shorter tabs because tabs are 4 spaces
vim.o.softtabstop = 0
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false

-- Allow certain keys to wrap around the end of lines
vim.o.whichwrap = vim.o.whichwrap .. '<,>,h,l'

-- Show line numbers
vim.o.number = true

-- Automatically remove trailing whitespace
vim.cmd([[autocmd BufWritePre <buffer> %s/\s\+$//e]])

-- Disable indentation on switch (C)
vim.o.cinoptions = 'l1'

-- Lazy Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

