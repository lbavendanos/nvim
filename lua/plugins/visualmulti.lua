return {
  'mg979/vim-visual-multi',
  branch = 'master',
  event = 'BufReadPost',
  init = function()
    vim.g.VM_maps = {
      ['Add Cursor Down'] = '<M-C-Down>',
      ['Add Cursor Up'] = '<M-C-Up>',
    }
  end,
}
