require('themes.nightfly')
-- require('themes.moonfly')

local colors = { black = '#000000', gray = '#181A1F' }

vim.cmd('highlight Normal guibg=' .. colors.black)
vim.cmd('highlight VertSplit guibg=' .. colors.black .. ' guifg=' .. colors.gray)

vim.api.nvim_exec(
  [[
  set guicursor=n-v-c:block-Cursor
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkon0
  set guicursor+=i:blinkwait10
]],
  false
)
