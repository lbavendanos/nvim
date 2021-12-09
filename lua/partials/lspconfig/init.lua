local config = {}

function config.on_attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })
  -- vim.lsp.handlers['textDocument/signatureHelp'] =
  --   vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = 'single' })

  -- Mappings.
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>i', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border = "single"})<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = "single"}})<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = "single"}})<CR>', opts)
  -- buf_set_keymap('n', '<leader>d',
  --                '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Saga keybinds
  buf_set_keymap('n', 'gp', '<cmd>Lspsaga preview_definition<CR>', opts)
  -- buf_set_keymap('n', 'K',
  --                '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>',
  --                opts)
  -- buf_set_keymap('n', '<leader>k',
  --                '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>',
  --                opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opts)
  -- buf_set_keymap('n', '<leader>i',
  --                '<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>',
  --                opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  buf_set_keymap('x', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', opts)
  -- buf_set_keymap('n', '<C-f>',
  --                '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>',
  --                opts)
  -- buf_set_keymap('n', '<C-b>',
  --                '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>',
  --                opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('v', '<leader>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#2e2e2e
      hi LspReferenceText cterm=bold ctermbg=red guibg=#2e2e2e
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#2e2e2e
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

return config
