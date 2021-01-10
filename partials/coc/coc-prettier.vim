command! -nargs=0 Prettier :CocCommand prettier.formatFile

nmap <leader>f :Prettier <CR>
