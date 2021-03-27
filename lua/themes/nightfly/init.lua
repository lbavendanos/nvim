vim.api.nvim_set_option('termguicolors', true)

vim.g.nightflyItalics = 1

vim.cmd('colorscheme nightfly')

local colors = { black = '#000000', white = '#C3CCDC' }

vim.cmd('highlight Normal guibg=' .. colors.black ..
          ' guifg=' .. colors.white)
