let $FZF_DEFAULT_COMMAND = 'rg --files --ignore --hidden --glob "!.git"'

" noremap <silent> <leader>p :GFiles<CR>
" noremap <silent> <leader>p :GFiles --cached --others --exclude-standard<CR>
" noremap <silent> <leader>P :Files<CR>
" noremap <silent> <leader>o :Rg<CR>
" noremap <silent> <leader>b :Buffers<CR

let g:fzf_preview_floating_window_rate = 0.6
let g:fzf_preview_use_dev_icons = 1

" noremap <silent> <leader>p :FzfPreviewProjectFiles<CR>
" noremap <silent> <leader>P :FzfPreviewDirectoryFiles<Space>
" noremap <silent> <leader>o :FzfPreviewProjectGrep<Space>
" noremap <silent> <leader>b :FzfPreviewBuffers<CR>
