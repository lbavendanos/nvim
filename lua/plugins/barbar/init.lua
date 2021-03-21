local api = vim.api
local g = vim.g
local keymapOptions = { noremap = true, silent = true }

g.bufferline = {
  animation = false
}

api.nvim_set_keymap('n', '<leader>w', ':BufferClose<CR>', keymapOptions)

api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', keymapOptions)
api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', keymapOptions)

api.nvim_set_keymap('n', '<leader>1', ':BufferGoto 1<CR>', keymapOptions)
api.nvim_set_keymap('n', '<leader>2', ':BufferGoto 2<CR>', keymapOptions)
api.nvim_set_keymap('n', '<leader>3', ':BufferGoto 3<CR>', keymapOptions)
api.nvim_set_keymap('n', '<leader>4', ':BufferGoto 4<CR>', keymapOptions)
api.nvim_set_keymap('n', '<leader>5', ':BufferGoto 5<CR>', keymapOptions)
api.nvim_set_keymap('n', '<leader>6', ':BufferGoto 6<CR>', keymapOptions)
api.nvim_set_keymap('n', '<leader>7', ':BufferGoto 7<CR>', keymapOptions)
api.nvim_set_keymap('n', '<leader>8', ':BufferGoto 8<CR>', keymapOptions)
api.nvim_set_keymap('n', '<leader>9', ':BufferLast<CR>', keymapOptions)
