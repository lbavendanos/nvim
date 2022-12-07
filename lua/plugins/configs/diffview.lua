local ok, diffview = pcall(require, 'diffview')

if not ok then
  print('diffview is not installed')
  return
end

diffview.setup()
