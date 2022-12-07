local ok, lsp_colors = pcall(require, 'lsp-colors')

if not ok then
  print('lsp-colors is not installed')
  return
end

lsp_colors.setup()
