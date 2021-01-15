let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/**"'

noremap <silent> <leader>p :Files<CR>
noremap <silent> <leader>P :Rg<CR>
