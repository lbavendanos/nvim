return {
  'windwp/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  cmd = { 'Spectre' },
  opts = {
    replace_engine = {
      ['sed'] = {
        cmd = 'sed',
        args = {
          '-i',
          '',
          '-E',
        },
      },
    },
  },
}
