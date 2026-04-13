-- [[ Keymaps ]]
local keymap_set = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear search highlight
keymap_set('n', '<Esc>', '<cmd>nohlsearch<CR>')

keymap_set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- File explorer
keymap_set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open file explorer' })

-- Split navigation
keymap_set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap_set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap_set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap_set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Visual mode movement
keymap_set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
keymap_set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
keymap_set('v', 'H', '<gv', { desc = 'Indent left' })
keymap_set('v', 'L', '>gv', { desc = 'Indent right' })

-- Clipboard / delete helpers
keymap_set('x', '<leader>p', [["_dP]], { desc = 'Paste without yanking' })
keymap_set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
keymap_set('n', '<leader>Y', [["+Y]], { desc = 'Yank line to system clipboard' })
keymap_set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without yanking' })
