local colors = require('utils.colors')

vim.g.nightflyItalics = 1
vim.g.nightflyCursorColor = 1
vim.g.nightflyNormalFloat = 1

vim.cmd([[colorscheme nightfly]])

vim.cmd('highlight Normal guibg=' .. colors.black)
vim.cmd('highlight VertSplit guibg=' .. colors.black .. ' guifg=' .. colors.chetwode_blue)
vim.cmd('highlight FloatBorder guifg=' .. colors.chetwode_blue)

vim.cmd([[
  set guicursor=n-v-c:block-Cursor
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkon0
  set guicursor+=i:blinkwait10
]])
