" Leader key
let g:mapleader = ' '

" Disable keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Space> <Nop>
nnoremap <backspace> <Nop>

" Reload init.vim
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" Basic
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

" Move selected line
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <Esc> <C-\><C-n>
nnoremap <C-\> <C-w>w

" Resize
nnoremap <silent> <leader><Up>    :resize -5<CR>
nnoremap <silent> <leader><Down>  :resize +5<CR>
nnoremap <silent> <leader><Left>  :vertical resize -5<CR>
nnoremap <silent> <leader><Right> :vertical resize +5<CR>
nnoremap <silent> <leader>= <C-w>=

" Indent
vnoremap > >gv
vnoremap < <gv

" Clear highlight
nnoremap <leader>/ :noh<CR>
