vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true })

require('nvim-tree').setup({
  disable_netrw = false,
  hijack_netrw = false,
  hijack_cursor = false,
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
    custom = { '.git' },
  },
  git = {
    ignore = false,
  },
})
