return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  version = '*',
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup({
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
  end,
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<cr>' },
  },
}
