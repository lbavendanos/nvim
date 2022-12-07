local config = {}

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == 'null-ls'
    end,
    async = true,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

function config.on_attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })
  -- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = 'single' })

  -- Mappings.
  local options = { noremap = true, silent = true }
  local bufoptions = { noremap = true, silent = true, buffer = bufnr }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
  buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
  -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>i', '<cmd>lua vim.diagnostic.open_float()<CR>', options)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', options)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', options)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', options)

  -- Telescope keybinds
  buf_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', options)
  buf_set_keymap('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', options)
  buf_set_keymap('n', '<leader>D', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', options)
  buf_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', options)
  -- buf_set_keymap('n', '<leader>ca', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts)
  buf_set_keymap('n', '<leader>d', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', options)

  -- Saga keybinds
  buf_set_keymap('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', options)

  vim.keymap.set('n', '<leader>f', lsp_formatting, bufoptions)

  -- if client.supports_method('textDocument/formatting') then
  --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     group = augroup,
  --     buffer = bufnr,
  --     callback = function()
  --       lsp_formatting(bufnr)
  --     end,
  --   })
  -- end

  -- Set some keybinds conditional on server capabilities
  -- if client.resolved_capabilities.document_formatting then
  --   vim.keymap.set('n', '<leader>f', function()
  --     vim.lsp.buf.format({ async = true })
  --   end, bufopts)
  -- end
  -- if client.resolved_capabilities.document_range_formatting then
  --   vim.keymap.set('v', '<leader>f', function()
  --     vim.lsp.buf.format({ async = true })
  --   end, bufopts)
  -- end

  -- Set autocommands conditional on server_capabilities
  -- if client.resolved_capabilities.document_highlight then
  --   vim.cmd([[
  --     hi LspReferenceRead cterm=bold ctermbg=red guibg=#2e2e2e
  --     hi LspReferenceText cterm=bold ctermbg=red guibg=#2e2e2e
  --     hi LspReferenceWrite cterm=bold ctermbg=red guibg=#2e2e2e
  --     augroup lsp_document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]])
  -- end
end

return config
