local ok, tree = pcall(require, 'nvim-tree')

if not ok then
  print('nvim-tree is not installed')
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
  hijack_netrw = false,
  update_focused_file = { enable = true },
  view = { width = 40 },
  renderer = {
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = false,
      },
    },
  },
  filters = {
    custom = { '^.git$' },
  },
  git = {
    ignore = false,
  },
})

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true })
