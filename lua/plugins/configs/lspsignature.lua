local ok, lsp_signature = pcall(require, 'lsp_signature')

if not ok then
  print('lsp_signature is not installed')
  return
end

lsp_signature.setup({
  hi_parameter = 'IncSearch', -- how your parameter will be highlight
})
