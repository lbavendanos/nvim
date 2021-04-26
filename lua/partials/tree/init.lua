vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = { '.git' }
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0
vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1 }

-- vim.cmd('autocmd BufWinEnter,FileType NvimTree setlocal cursorline')

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>',
                        { noremap = true })
