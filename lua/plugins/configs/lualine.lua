local ok, lualine = pcall(require, 'lualine')

if not ok then
  print('lualine is not installed')
  return
end

local config = lualine.get_config()
local lualine_c = {
  'branch',
  'diff',
  'diagnostics',
  'filename',
}

local function icon()
  return ' '
end

lualine.setup({
  sections = {
    lualine_a = { icon },
    lualine_b = config.sections.lualine_a,
    lualine_c = lualine_c,
  },
  extensions = { 'quickfix', 'nvim-tree', 'fugitive' },
})
