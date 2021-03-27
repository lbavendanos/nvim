vim.g.maximizer_set_default_mapping = 0

vim.api.nvim_set_keymap('n', '<leader>m', ':MaximizerToggle<CR>', { noremap = true, silent = true })
