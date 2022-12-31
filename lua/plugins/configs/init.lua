local plugins = {
  'theme',
  'tree',
  -- 'lualine',
  'tabline',
  'feline',
  -- 'tabby',
  'bufdelete',
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
