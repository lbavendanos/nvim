require('lspsaga').init_lsp_saga({
  finder_action_keys = {
    open = 'o',
    vsplit = 's',
    split = 'i',
    quit = '<Escape>',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
  code_action_keys = { quit = '<Escape>', exec = '<CR>' },
  rename_action_keys = { quit = '<Escape>', exec = '<CR>' },
})
