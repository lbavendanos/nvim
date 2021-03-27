vim.api.nvim_set_option('termguicolors', true)

vim.g.moonflyItalics = 1

vim.cmd('colorscheme moonfly')

local colors = { black = '#000000', white = '#C6C6C6', grey236 = '#212121' }

vim.cmd('highlight Normal ctermbg=232 ctermfg=251 guibg=' .. colors.black ..
          ' guifg=' .. colors.white)

-- vim.cmd('highlight VertSplit ctermbg=236 ctermfg=236 cterm=none guibg=' ..
--           colors.grey236 .. ' guifg=' .. colors.grey236 .. ' gui=none')
