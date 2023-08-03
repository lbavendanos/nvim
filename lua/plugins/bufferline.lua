return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  enabled = true,
  config = function()
    local bufferline = require('bufferline')

    bufferline.setup({
      options = {
        style_preset = bufferline.style_preset.no_italic,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })

    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>1', '<cmd>lua require("bufferline").go_to(1, true)<CR>', opts)
    vim.keymap.set('n', '<leader>2', '<cmd>lua require("bufferline").go_to(2, true)<CR>', opts)
    vim.keymap.set('n', '<leader>3', '<cmd>lua require("bufferline").go_to(3, true)<CR>', opts)
    vim.keymap.set('n', '<leader>4', '<cmd>lua require("bufferline").go_to(4, true)<CR>', opts)
    vim.keymap.set('n', '<leader>5', '<cmd>lua require("bufferline").go_to(5, true)<CR>', opts)
    vim.keymap.set('n', '<leader>6', '<cmd>lua require("bufferline").go_to(6, true)<CR>', opts)
    vim.keymap.set('n', '<leader>7', '<cmd>lua require("bufferline").go_to(7, true)<CR>', opts)
    vim.keymap.set('n', '<leader>8', '<cmd>lua require("bufferline").go_to(8, true)<CR>', opts)
    vim.keymap.set('n', '<leader>9', '<cmd>lua require("bufferline").go_to(9, true)<CR>', opts)
    vim.keymap.set('n', '<leader>$', '<cmd>lua require("bufferline").go_to(-1, true)<CR>', opts)
  end,
}
