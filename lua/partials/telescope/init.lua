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

require('telescope').setup(config)
-- Extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('neoclip')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('ui-select')
require('telescope').load_extension('live_grep_raw')

require('partials.telescope.highlight')
require('partials.telescope.mappings')
