return {
  'nvimdev/lspsaga.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lspsaga').setup({
      symbol_in_winbar = {
        enable = false,
      },
      rename = {
        in_select = false,
      },
    })
  end,
  event = 'BufReadPost',
}
