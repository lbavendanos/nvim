local plugins = {
  'theme',
  'tree',
  -- 'lualine',
  -- 'tabline',
  'tabby',
  'feline',
  'telescope',
  'treesitter',
  'colorizer',
  'lspsaga',
  'lspsignature',
  'lspcolors',
  'trouble',
  'luasnip',
  'cmp',
  'gitsigns',
  'diffview',
  'maximizer',
  'comment',
  -- 'todocomments',
  'autopairs',
  'mason',
  'lsp',
}

for _, value in pairs(plugins) do
  require('plugins.configs.' .. value)
end
