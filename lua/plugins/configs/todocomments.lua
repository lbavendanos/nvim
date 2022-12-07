local ok, todo_comments = pcall(require, 'todo-comments')

if not ok then
  print('todo-comments is not installed')
  return
end

todo_comments.setup()

local options = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>dt', '<cmd>TodoTrouble<CR>', options)
vim.keymap.set('n', '<leader>dp', '<cmd>TodoTelescope<CR>', options)
