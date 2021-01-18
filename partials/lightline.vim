let g:lightline#bufferline#enable_devicons =1
let g:lightline#bufferline#enable_nerdfont =1
let g:lightline#bufferline#unnamed = '[No Name]'

let g:lightline = {
  \ 'colorscheme': 'nightfly',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'tabline': {
  \   'left': [ ['buffers'] ],
  \   'right': [ ['close'] ]
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel'
  \ }
  \ }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
