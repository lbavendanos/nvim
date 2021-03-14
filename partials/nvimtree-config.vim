let g:nvim_tree_width = 40
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_disable_netrw = 0
let g:nvim_tree_hijack_netrw = 0
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'files': 1,
    \ } 

" Hide Cursor and active Cursorline
augroup Cursor
  au!
  au WinLeave,FileType NvimTree setlocal guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
  au WinEnter,FileType NvimTree setlocal guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
  au WinLeave,FileType NvimTree setlocal nocursorline
  au WinEnter,FileType NvimTree setlocal cursorline
augroup END
au FileType NvimTree hi Cursor blend=100

nnoremap <leader>e :NvimTreeToggle<CR>
