return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
  },
  config = function()
    local telescope = require('telescope')
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

    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')
    telescope.load_extension('ui-select')
    telescope.load_extension('live_grep_args')
  end,
  cmd = 'Telescope',
  keys = {
    { '<leader>?', '<cmd>Telescope oldfiles<cr>' },
    { '<leader>p', '<cmd>Telescope find_files<cr>' },
    { '<leader>P', '<cmd>Telescope file_browser<cr>' },
    { '<leader>b', '<cmd>Telescope buffers<cr>' },
    {
      '<leader>o',
      function()
        require('telescope').extensions.live_grep_args.live_grep_args()
      end,
    },
  },
}
