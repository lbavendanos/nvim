require('trouble').setup()

local opts = { noremap = true, silent = true }

-- vim.api.nvim_set_keymap('n', '<leader>dx', '<cmd>Trouble<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>dw', '<cmd>Trouble lsp_workspace_diagnostics<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Trouble lsp_document_diagnostics<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>Trouble loclist<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>dq', '<cmd>Trouble quickfix<cr>', opts)
-- vim.api.nvim_set_keymap('n', 'gR', '<cmd>Trouble lsp_references<cr>', opts)
