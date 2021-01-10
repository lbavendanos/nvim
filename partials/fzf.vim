let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/**"'
" let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'Dracula'

" let g:fzf_preview_use_dev_icons = 1
" let g:COLORTERM='truecolor'
"
" augroup fzf_preview
"   autocmd!
"   autocmd User fzf_preview#rpc#initialized call s:fzf_preview_settings() " fzf_preview#remote#initialized or fzf_preview#coc#initialized
" augroup END
"
" function! s:fzf_preview_settings() abort
"   let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
"   let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
" endfunction

" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" nnoremap <silent> <leader>p :FzfPreviewProjectFiles<CR>
noremap <silent> <leader>p :Files<CR>
noremap <silent> <leader>P :Rg<CR>
