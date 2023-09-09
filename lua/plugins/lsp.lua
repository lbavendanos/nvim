return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    { 'folke/neoconf.nvim', cmd = 'Neoconf', config = true },
    { 'ray-x/lsp_signature.nvim', config = { hi_parameter = 'IncSearch' } },
    'nvim-telescope/telescope.nvim',
    'nvimdev/lspsaga.nvim',
    'folke/lsp-colors.nvim',
  },
  config = function()
    local lspconfig = require('lspconfig')
    local null_ls = require('null-ls')

    local lsp_format_filter = function(client)
      local filetype = vim.bo.filetype
      local sources = require('null-ls.sources')
      local method = null_ls.methods.FORMATTING
      local available_formatters = sources.get_available(filetype, method)

      if #available_formatters > 0 then
        return client.name == 'null-ls'
      end

      return client.supports_method('textDocument/formatting')
    end

    local lsp_format = function(bufnr)
      vim.lsp.buf.format({
        filter = lsp_format_filter,
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

      vim.keymap.set('n', '<leader>f', lsp_format, bufopts)
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.formatting.prettierd,
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

    lspconfig.lua_ls.setup({
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
        client.server_capabilities.documentFormattingProvider = false

        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
    })

    lspconfig.svelte.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.astro.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.graphql.setup({
      on_attach = on_attach,
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
  end,
  event = 'BufReadPre',
}
