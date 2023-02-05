return {
  'szw/vim-maximizer',
  config = function()
    vim.g.maximizer_set_default_mapping = 0
  end,
  keys = {
    { '<leader>m', '<cmd>MaximizerToggle<cr>' },
  },
}
