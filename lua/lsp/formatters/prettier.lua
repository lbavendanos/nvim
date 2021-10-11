return {
  -- formatCommand = './node_modules/.bin/prettier --stdin --stdin-filepath ${INPUT}',
  formatCommand = 'prettierd ${INPUT}',
  formatStdin = true,
}
