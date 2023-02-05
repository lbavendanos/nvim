return {
  'glepnir/lspsaga.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lspsaga').setup({
      symbol_in_winbar = {
        separator = '  ',
      },
      rename = {
        in_select = false,
      },
    })
  end,
  event = 'BufReadPost',
}
