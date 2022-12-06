local ok, lspsaga = pcall(require, 'lspsaga')

if not ok then
  return
end

lspsaga.init_lsp_saga({
  finder_action_keys = {
    quit = '<Escape>',
  },
  code_action_keys = { quit = '<Escape>', exec = '<CR>' },
  rename_action_keys = { quit = '<Escape>', exec = '<CR>' },
})
