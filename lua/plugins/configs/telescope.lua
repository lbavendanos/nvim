local ok, telescope = pcall(require, 'telescope')

if not ok then
  print('telescope is not installed')
  return
end

local actions = require('telescope.actions')

local mappings = {
  i = { ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist },
  n = { ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist },
}

local defaults = require('telescope.themes').get_dropdown({ mappings = mappings })

telescope.setup({
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
})

-- Extensions
telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('ui-select')
telescope.load_extension('live_grep_args')

local options = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, options)
vim.keymap.set('n', '<leader>p', require('telescope.builtin').find_files, options)
vim.keymap.set('n', '<leader>P', require('telescope').extensions.file_browser.file_browser, options)
-- vim.keymap.set('n', '<leader>o', require('telescope.builtin').live_grep, options)
vim.keymap.set('n', '<leader>o', require('telescope').extensions.live_grep_args.live_grep_args, options)
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, options)
