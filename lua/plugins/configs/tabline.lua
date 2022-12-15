local ok, tabline = pcall(require, 'tabline')

if not ok then
  print('tabline is not installed')
  return
end

tabline.setup({ enable = true })
