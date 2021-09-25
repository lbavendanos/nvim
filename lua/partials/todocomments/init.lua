require('todo-comments').setup()

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>dt', '<cmd>TodoTrouble<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>TodoTelescope<CR>', opts)
