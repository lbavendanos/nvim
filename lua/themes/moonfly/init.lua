vim.api.nvim_set_option('termguicolors', true)

vim.g.moonflyItalics = 1

vim.cmd('colorscheme moonfly')

local colors = { black = '#000000', gray = '#181A1F' }

vim.cmd('highlight Normal guibg=' .. colors.black)
vim.cmd('highlight VertSplit guibg=' .. colors.black .. ' guifg=' .. colors.gray)
