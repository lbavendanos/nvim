local ok, tabline = pcall(require, 'tabline')

if not ok then
  return
end

tabline.setup({ enable = true })

local options = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>w', ':Bdelete<CR>', options)

vim.keymap.set('n', '<TAB>', ':TablineBufferNext<CR>', options)
vim.keymap.set('n', '<S-TAB>', ':TablineBufferPrevious<CR>', options)
