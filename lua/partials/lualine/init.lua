local custom_theme = require('partials.lualine.themes.custom')
local default_config = require('lualine').get_config()
local colors = require('utils.colors')
local lualine_c = {
  'branch',
  {
    'diff',
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.purple },
      removed = { fg = colors.red },
    },
  },
  { 'diagnostics', sources = { 'nvim_diagnostic', 'coc' } },
  'filename',
}

local function icon()
  return ' '
end

require('lualine').setup({
  options = {
    theme = custom_theme,
  },
  sections = {
    lualine_a = { icon },
    lualine_b = default_config.sections.lualine_a,
    lualine_c = lualine_c,
  },
  extensions = { 'quickfix', 'nvim-tree', 'fugitive' },
})
