local ok, lsp_colors = pcall(require, 'lsp-colors')

if not ok then
  return
end

lsp_colors.setup()
