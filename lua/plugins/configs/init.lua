local plugins = {
  'tree',
  'lualine',
  'tabline',
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
  'todocomments',
  'autopairs',
  'lsp',
}

for _, value in pairs(plugins) do
  require('plugins.configs.' .. value)
end
