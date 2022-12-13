local ok, theme = pcall(require, 'catppuccin')

if not ok then
  print('theme is not installed')
  return
end

theme.setup({
  flavour = 'mocha', -- latte, frappe, macchiato, mocha
  term_colors = true,
  transparent_background = false,
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
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
        NormalFloat = { bg = c.none },
        CmpBorder = { fg = c.surface2 },
        Pmenu = { bg = c.none },
        TabLineSel = { bg = c.pink },
        NvimTreeNormal = { bg = c.none },
        NvimTreeVertSplit = { fg = c.crust },
        TelescopeBorder = { link = 'FloatBorder' },
      }
    end,
  },
})

vim.cmd([[colorscheme catppuccin]])
