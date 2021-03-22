local  vim = vim
local api = vim.api
local keymapOptions = { noremap = true }

builtin = require('telescope.builtin')
findFilesOptions = {
  find_command={'rg','--ignore','--hidden','--files'}
}

api.nvim_set_keymap('n', '<leader>p', '<cmd>lua builtin.find_files(findFilesOptions)<CR>', keymapOptions)
api.nvim_set_keymap('n', '<leader>P', '<cmd>lua builtin.file_browser()<CR>', keymapOptions)
api.nvim_set_keymap('n', '<leader>o', '<cmd>lua builtin.live_grep()<CR>', keymapOptions)
api.nvim_set_keymap('n', '<leader>b', '<cmd>lua builtin.buffer()<CR>', keymapOptions)

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore',
      '--hidden'
    },
    file_ignore_patterns = {'.git'},
    sorting_strategy = 'ascending',
    layout_strategy = 'center',
    results_title = false,
    preview_title = 'Preview',
    preview_cutoff = 1, -- Preview should always show (unless previewer = false)
    width = 80,
    results_height = 15,
  }
}
