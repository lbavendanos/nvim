return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'TodoTrouble', 'TodoTelescope' },
  event = 'BufReadPost',
  config = true,
}
