local opts = { noremap = true }

-- Leader key
vim.g.mapleader = ' '

-- Disable keys
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', opts)
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', opts)
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', opts)
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', opts)
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', opts)
vim.api.nvim_set_keymap('n', '<backspace>', '<Nop>', opts)

-- Basic
vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', opts)

-- Move selected line
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', opts)
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', opts)

-- Windows navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)
vim.api.nvim_set_keymap('n', '<C-\\>', '<C-w>w', opts)

-- Resize
vim.api.nvim_set_keymap('n', '<leader><Up>', ':resize -5<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader><Down>', ':resize +5<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader><Left>', ':vertical resize -5<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader><Right>', ':vertical resize +5<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>=', '<C-w>=', opts)

-- Indent
vim.api.nvim_set_keymap('v', '>', '>gv', opts)
vim.api.nvim_set_keymap('v', '<', '<gv', opts)

-- Clear highlight
vim.api.nvim_set_keymap('n', '<leader>/', ':noh<CR>', opts)
