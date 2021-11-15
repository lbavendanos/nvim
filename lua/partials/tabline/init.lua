require('tabline').setup({ enable = true })

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>w', ':Bdelete<CR>', opts)

vim.api.nvim_set_keymap('n', '<TAB>', ':TablineBufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-TAB>', ':TablineBufferPrevious<CR>', opts)
