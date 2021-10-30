vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}

-- vim.cmd('autocmd BufWinEnter,FileType NvimTree setlocal cursorline')

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true })

require('nvim-tree').setup({
  disable_netrw = false,
  hijack_netrw = false,
  hijack_cursor = false,
  update_focused_file = { enable = true },
  view = { width = 40 },
  filters = {
    custom = { '.git' },
  },
})
