" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/**"'

noremap <silent> <leader>o :Files<CR>
noremap <silent> <leader>O :Rg<CR>
noremap <silent> <leader>p :GFiles<CR>
noremap <silent> <leader>b :Buffers<CR>
