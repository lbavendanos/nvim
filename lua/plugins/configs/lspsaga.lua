local ok, lspsaga = pcall(require, 'lspsaga')

if not ok then
  print('lspsaga is not installed')
  return
end

lspsaga.setup({
  symbol_in_winbar = {
    separator = '  ',
  },
  rename = {
    in_select = false,
    whole_project = false,
  },
})
