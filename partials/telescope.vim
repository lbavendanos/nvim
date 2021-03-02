nnoremap <leader>p <cmd>Telescope find_files find_command=rg,--files,--ignore,--hidden<CR>
nnoremap <leader>P <cmd>Telescope file_browser<CR>
nnoremap <leader>o <cmd>Telescope live_grep<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>

lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {'.git'},
    sorting_strategy = "ascending",
    layout_strategy = "center",
    results_title = false,
    preview_title = "Preview",
    preview_cutoff = 1, -- Preview should always show (unless previewer = false)
    width = 80,
    results_height = 15,
  }
}
EOF
