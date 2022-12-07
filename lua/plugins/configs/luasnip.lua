local ok, luasnip = pcall(require, 'luasnip.loaders.from_vscode')

if not ok then
  print('luasnip is not installed')
  return
end

luasnip.load()
