local opts = { noremap = true }

vim.api.nvim_set_keymap('n', '<leader>p',
                        '<cmd>lua require("telescope.builtin").find_files({find_command={"rg","--ignore","--hidden","--files"}})<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<leader>P',
                        '<cmd>lua require("telescope.builtin").file_browser()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<leader>o',
                        '<cmd>lua require("telescope.builtin").live_grep()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<leader>b',
                        '<cmd>lua require("telescope.builtin").buffers()<CR>',
                        opts)

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg', '--color=never', '--no-heading', '--with-filename', '--line-number',
      '--column', '--smart-case', '--ignore', '--hidden'
    },
    file_ignore_patterns = { '.git' },
    sorting_strategy = 'ascending',
    layout_strategy = 'center',
    results_title = false,
    preview_title = 'Preview',
    layout_config = {
      preview_cutoff = 1, -- Preview should always show (unless previewer = false)
      width = 80,
      height = 15
    }
  }
}
