return {
  'echasnovski/mini.bufremove',
  config = function()
    require('mini.bufremove').setup()
  end,
  keys = {
    { '<leader>w', '<cmd>lua MiniBufremove.delete()<cr>' },
  },
}
