local ok, _ = pcall(require, 'bufdelete')

if not ok then
  print('bufdelete is not installed')
  return
end

local options = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>w', ':Bdelete<CR>', options)
