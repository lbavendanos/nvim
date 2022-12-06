require('catppuccin').setup({
  flavour = 'mocha', -- latte, frappe, macchiato, mocha
  term_colors = true,
  transparent_background = false,
  color_overrides = {
    latte = {
      base = '#e1eef5',
    },
    mocha = {
      base = '#000000',
    },
  },
  highlight_overrides = {
    latte = function(_)
      return {
        NvimTreeNormal = { bg = '#d1e5f0' },
      }
    end,
    mocha = function(c)
      return {
        TabLineSel = { bg = c.pink },
        NvimTreeNormal = { bg = c.none },
        CmpBorder = { fg = c.surface2 },
        Pmenu = { bg = c.none },
        NormalFloat = { bg = c.none },
        TelescopeBorder = { link = 'FloatBorder' },
      }
    end,
  },
})

vim.cmd([[colorscheme catppuccin]])
