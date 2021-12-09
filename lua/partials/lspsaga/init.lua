require('lspsaga').init_lsp_saga({
  finder_action_keys = {
    quit = '<Escape>',
  },
  code_action_keys = { quit = '<Escape>', exec = '<CR>' },
  rename_action_keys = { quit = '<Escape>', exec = '<CR>' },
})
