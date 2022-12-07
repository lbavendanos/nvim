local ok, telescope = pcall(require, 'telescope')

if not ok then
  print('telescope is not installed')
  return
end

local defaults = require('telescope.themes').get_dropdown({})
local config = {
  defaults = defaults,
  pickers = {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
    },
    lsp_code_actions = {
      theme = 'cursor',
    },
  },
  extensions = {
    file_browser = {
      respect_gitignore = true,
    },
  },
}

telescope.setup(config)
-- Extensions
telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('ui-select')
telescope.load_extension('live_grep_args')

local options = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>p', '<cmd>lua require("telescope.builtin").find_files()<CR>', options)
vim.keymap.set('n', '<leader>P', '<cmd>lua require "telescope".extensions.file_browser.file_browser()<CR>', options)
-- vim.keymap.set('n', '<leader>o', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
vim.keymap.set(
  'n',
  '<leader>o',
  '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>',
  options
)
vim.keymap.set('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<CR>', options)
