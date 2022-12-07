local ok, trouble = pcall(require, 'trouble')

if not ok then
  print('trouble is not installed')
  return
end

trouble.setup()

local opts = { noremap = true, silent = true }

-- vim.keymap.set('n', '<leader>dx', '<cmd>Trouble<cr>', opts)
vim.keymap.set('n', '<leader>dw', '<cmd>Trouble lsp_workspace_diagnostics<cr>', opts)
vim.keymap.set('n', '<leader>dd', '<cmd>Trouble lsp_document_diagnostics<cr>', opts)
vim.keymap.set('n', '<leader>dl', '<cmd>Trouble loclist<cr>', opts)
vim.keymap.set('n', '<leader>dq', '<cmd>Trouble quickfix<cr>', opts)
-- vim.keymap.set('n', 'gR', '<cmd>Trouble lsp_references<cr>', opts)
