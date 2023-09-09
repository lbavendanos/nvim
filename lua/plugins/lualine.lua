return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('lualine').setup({
      extensions = {
        'nvim-tree',
        'fugitive',
      },
    })
  end,
}
