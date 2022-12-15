local ok, lspconfig = pcall(require, 'lspconfig')

if not ok then
  print('lspconfig is not installed')
  return
end

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

local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })

  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>i', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)

  -- Telescope keybinds
  local builtin = require('telescope.builtin')

  vim.keymap.set('n', 'gd', builtin.lsp_definitions, bufopts)
  vim.keymap.set('n', 'gi', builtin.lsp_implementations, bufopts)
  vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, bufopts)
  vim.keymap.set('n', 'gr', builtin.lsp_references, bufopts)
  vim.keymap.set('n', '<leader>d', builtin.diagnostics, bufopts)

  -- Saga keybinds
  vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', bufopts)

  vim.keymap.set('n', '<leader>f', lsp_formatting, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local null_ls = require('null-ls')

local sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.phpcsfixer,
}

null_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  autostart = true,
  sources = sources,
})

lspconfig.vimls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

lspconfig.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = capabilities,
})

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
