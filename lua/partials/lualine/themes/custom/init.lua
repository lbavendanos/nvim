local colors = require('utils.colors')

return {
  normal = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.blue, fg = colors.black, gui = 'bold' },
    c = { bg = colors.gray, fg = colors.blue },
    x = { bg = colors.orange, fg = colors.black },
    y = { bg = colors.cyan, fg = colors.black },
    z = { bg = colors.purple, fg = colors.black },
  },
  insert = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.purple, fg = colors.black, gui = 'bold' },
    c = { bg = colors.gray, fg = colors.purple },
    x = { bg = colors.orange, fg = colors.black },
    y = { bg = colors.cyan, fg = colors.black },
    z = { bg = colors.purple, fg = colors.black },
  },
  visual = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.orange, fg = colors.black, gui = 'bold' },
    c = { bg = colors.gray, fg = colors.orange },
    x = { bg = colors.orange, fg = colors.black },
    y = { bg = colors.cyan, fg = colors.black },
    z = { bg = colors.purple, fg = colors.black },
  },
  replace = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.cyan, fg = colors.black, gui = 'bold' },
    c = { bg = colors.gray, fg = colors.cyan },
    x = { bg = colors.orange, fg = colors.black },
    y = { bg = colors.cyan, fg = colors.black },
    z = { bg = colors.purple, fg = colors.black },
  },
  command = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.pink, fg = colors.black, gui = 'bold' },
    c = { bg = colors.gray, fg = colors.pink },
    x = { bg = colors.orange, fg = colors.black },
    y = { bg = colors.cyan, fg = colors.black },
    z = { bg = colors.purple, fg = colors.black },
  },
  inactive = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.blue, fg = colors.black, gui = 'bold' },
    c = { bg = colors.gray, fg = colors.blue },
    x = { bg = colors.purple, fg = colors.black },
    y = { bg = colors.cyan, fg = colors.black },
    z = { bg = colors.purple, fg = colors.black },
  },
}
