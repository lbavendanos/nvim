local options = { noremap = true }

-- Leader key
vim.g.mapleader = ' '

-- Disable keys
vim.keymap.set('n', '<Up>', '<Nop>', options)
vim.keymap.set('n', '<Down>', '<Nop>', options)
vim.keymap.set('n', '<Left>', '<Nop>', options)
vim.keymap.set('n', '<Right>', '<Nop>', options)
vim.keymap.set('n', '<Space>', '<Nop>', options)
vim.keymap.set('n', '<backspace>', '<Nop>', options)

-- Basic
vim.keymap.set('n', '<leader>s', ':w<CR>', options)
vim.keymap.set('n', '<leader>q', ':q<CR>', options)

-- Move selected line
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", options)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", options)

-- Windows navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', options)
vim.keymap.set('n', '<C-j>', '<C-w>j', options)
vim.keymap.set('n', '<C-k>', '<C-w>k', options)
vim.keymap.set('n', '<C-l>', '<C-w>l', options)
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', options)
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', options)
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', options)
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', options)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', options)
vim.keymap.set('n', '<C-\\>', '<C-w>w', options)

-- Buffer navigation
vim.keymap.set('n', '<TAB>', ':bnext<CR>', options)
vim.keymap.set('n', '<S-TAB>', ':bprev<CR>', options)

-- Resize
vim.keymap.set('n', '<leader><Up>', ':resize -5<CR>', options)
vim.keymap.set('n', '<leader><Down>', ':resize +5<CR>', options)
vim.keymap.set('n', '<leader><Left>', ':vertical resize -5<CR>', options)
vim.keymap.set('n', '<leader><Right>', ':vertical resize +5<CR>', options)
vim.keymap.set('n', '<leader>=', '<C-w>=', options)

-- Indent
vim.keymap.set('v', '>', '>gv', options)
vim.keymap.set('v', '<', '<gv', options)

-- Clear highlight
vim.keymap.set('n', '<leader>/', ':noh<CR>', options)
