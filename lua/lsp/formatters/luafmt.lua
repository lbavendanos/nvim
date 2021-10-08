return {
  formatCommand = [[
    lua-format -i \
    --indent-width=2 \
    --tab-width=2 \
    --continuation-indent-width=2 \
    --spaces-inside-table-braces \
    --double-quote-to-single-quote \
  ]],
  formatStdin = true,
}
