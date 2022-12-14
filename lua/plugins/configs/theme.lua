local theme = 'kanagawa' -- catppuccin, nightfox, kanagawa

-- catppuccin
-- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
-- kanagawa
local colorscheme = 'kanagawa'

local ok, plugin = pcall(require, theme)

if not ok then
  print('theme is not installed')
  return
end

local configs = {
  catppuccin = {
    flavour = 'mocha', -- latte, frappe, macchiato, mocha
    term_colors = true,
    transparent_background = false,
    no_italic = false,
    no_bold = false,
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
  },
  nightfox = {
    groups = {
      all = {
        Normal = { bg = 'NONE' },
        NvimTreeNormal = { bg = 'NONE' },
      },
    },
  },
  kanagawa = {
    overrides = {
      Normal = { bg = 'NONE' },
      NvimTreeNormal = { bg = 'NONE' },
      TelescopeBorder = { bg = 'NONE' },
    },
  },
}

plugin.setup(configs[theme])

vim.cmd('colorscheme ' .. colorscheme)
