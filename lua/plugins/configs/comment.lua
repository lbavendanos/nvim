local ok, comment = pcall(require, 'nvim_comment')

if not ok then
  return
end

comment.setup()
