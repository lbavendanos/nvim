local ok, comment = pcall(require, 'nvim_comment')

if not ok then
  print('nvim_comment is not installed')
  return
end

comment.setup()
