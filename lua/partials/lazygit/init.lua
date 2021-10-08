local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'lazygit',
  dir = 'git_dir',
  direction = 'float',
  float_opts = { border = 'single' },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd('startinsert!')
    vim.api.nvim_buf_set_keymap(term.bufnr, 't', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
    -- print(vim.fn.mapcheck('<esc>', 't'))
    if vim.fn.mapcheck('<esc>', 't') ~= '' then
      -- vim.api.nvim_buf_del_keymap(term.bufnr, 't', '<esc>')
      vim.api.nvim_del_keymap('t', '<esc>')
    end
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd('Closing terminal')

    -- vim.api.nvim_set_keymap('t', '<esc>', '<C-\\><C-n>')
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
