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
  vim.keymap.set('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', bufopts)
  vim.keymap.set('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', bufopts)
  vim.keymap.set('n', '<leader>D', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', bufopts)
  vim.keymap.set('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', bufopts)
  -- vim.keymap.set('n', '<leader>ca', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts)
  vim.keymap.set('n', '<leader>d', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', bufopts)

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

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
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

local configs = require('lspconfig.configs')

configs.emmet_ls = {
  default_config = {
    -- cmd = { 'emmet-ls', '--stdio' },
    cmd = { 'ls_emmet', '--stdio' },
    filetypes = {
      'html',
      'css',
      'scss',
      'javascript',
      'javascript.jsx',
      'javascriptreact',
      'typescript',
      'typescript.tsx',
      'typescriptreact',
      'haml',
      'xml',
      'xsl',
      'pug',
      'slim',
      'sass',
      'stylus',
      'less',
      'sss',
      'vue',
    },
    -- filetypes = { 'html', 'css' },
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {},
  },
}

lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
