local ok, lspsaga = pcall(require, 'lspsaga')

if not ok then
  print('lspsaga is not installed')
  return
end

lspsaga.init_lsp_saga({
  code_action_keys = { quit = '<Escape>', exec = '<CR>' },
  rename_in_select = false,
})
