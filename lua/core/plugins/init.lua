local plugins = {
  'tree',
}

for _, value in pairs(plugins) do
  require('core.plugins.' .. value)
end
