local ok, comment = pcall(require, 'Comment')

if not ok then
  print('Comment is not installed')
  return
end

comment.setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
