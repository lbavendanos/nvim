local colors = require('utils.colors')

require('themes.nightfly')
-- require('themes.moonfly')

vim.cmd('highlight Normal guibg=' .. colors.black)
vim.cmd('highlight VertSplit guibg=' .. colors.black .. ' guifg=' .. colors.dark_blue)

vim.cmd([[
  set guicursor=n-v-c:block-Cursor
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkon0
  set guicursor+=i:blinkwait10
]])
