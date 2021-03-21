local g = vim.g
local api = vim.api

g.nvim_tree_width = 40
g.nvim_tree_ignore = { '.git' }
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_disable_netrw = 0
g.nvim_tree_hijack_netrw = 0
g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1 }

-- vim.cmd('augroup Cursor')
-- vim.cmd('autocmd!')
-- vim.cmd('autocmd WinLeave,FileType NvimTree setlocal guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,')
-- vim.cmd('autocmd WinEnter,FileType NvimTree setlocal guicursor=n-c-v:block-Cursor/Cursor-blinkon0,')
-- vim.cmd('autocmd WinLeave,FileType NvimTree setlocal nocursorline')
-- vim.cmd('autocmd WinEnter,FileType NvimTree setlocal cursorline')
-- vim.cmd('augroup END')
-- vim.cmd('autocmd FileType NvimTree hi Cursor blend=100')

api.nvim_exec([[
augroup Cursor
  au!
  au WinLeave,FileType NvimTree setlocal guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
  au WinEnter,FileType NvimTree setlocal guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
  au WinEnter,FileType NvimTree setlocal cursorline
augroup END
au FileType NvimTree hi Cursor blend=100
]], false)

api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })
