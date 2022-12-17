local ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if not ok then
  print('treesitter is not installed')
  return
end

treesitter.setup({
  ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { 'phpdoc' },
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  autotag = { enable = true },
  rainbow = { enable = true, extended_mode = false },
  context_commentstring = { enable = true, enable_autocmd = false },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
})
