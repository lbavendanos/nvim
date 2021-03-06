local opts = { noremap = true, silent = true }

vim.g.bufferline = vim.g.bufferline or { animation = false }

vim.api.nvim_set_keymap('n', '<leader>w', ':BufferClose<CR>', opts)

vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>1', ':BufferGoto 1<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>2', ':BufferGoto 2<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>3', ':BufferGoto 3<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>4', ':BufferGoto 4<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>5', ':BufferGoto 5<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>6', ':BufferGoto 6<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>7', ':BufferGoto 7<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>8', ':BufferGoto 8<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>9', ':BufferLast<CR>', opts)
