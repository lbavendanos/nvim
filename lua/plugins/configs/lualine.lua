local ok, lualine = pcall(require, 'lualine')

if not ok then
  return
end

local default_config = lualine.get_config()
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

lualine.setup({
  options = {
    theme = 'catppuccin',
  },
  sections = {
    lualine_a = { icon },
    lualine_b = default_config.sections.lualine_a,
    lualine_c = lualine_c,
  },
  extensions = { 'quickfix', 'nvim-tree', 'fugitive' },
})
