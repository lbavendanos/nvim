pcall(require, 'impatient')

-- Plugin
require('plugins')

-- Core
require('core.options')
require('core.mappings')

-- Setup plugins
require('plugins.configs')

-- LSP
require('lsp')

-- Theme
require('core.theme')
