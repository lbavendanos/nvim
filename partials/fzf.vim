" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/**"'

" noremap <silent> <leader>p :GFiles<CR>
noremap <silent> <leader>p :GFiles --cached --others --exclude-standard<CR>
noremap <silent> <leader>P :Files<CR>
noremap <silent> <leader>o :Rg<CR>
noremap <silent> <leader>b :Buffers<CR>
