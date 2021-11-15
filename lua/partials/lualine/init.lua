local custom_theme = require('partials.lualine.theme')
local default_config = require('lualine').get_config()
local lualine_c = {
  'branch',
  {
    'diff',
    diff_color = {
      added = { fg = '#50fa7b' },
      modified = { fg = '#bd93f9' },
      removed = { fg = '#ff5555' },
    },
  },
  { 'diagnostics', sources = { 'nvim_lsp', 'coc' } },
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
