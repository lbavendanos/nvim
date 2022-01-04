local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
vim.api.nvim_set_keymap(
  'n',
  '<leader>P',
  '<cmd>lua require "telescope".extensions.file_browser.file_browser()<CR>',
  opts
)
vim.api.nvim_set_keymap('n', '<leader>o', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
