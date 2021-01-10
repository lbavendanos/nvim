" Leader key
let g:mapleader = ' '

" Disable keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Space> <Nop>
nnoremap <CR> <Nop>
nnoremap <backspace> <Nop>

" Reload init.vim
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" Basic
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>

" Move selected line
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Buffer navigation
nnoremap <silent> <TAB> :bn<CR>
nnoremap <silent> <S-TAB> :bp<CR>

" Close buffer
nnoremap <silent> <leader>w :bd<CR>

" Windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>z <C-w>w

" Resize
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>= <C-w>=

" Scroll
map <S-Down> <C-E>
map <S-Up> <C-Y>

" Indent
vnoremap > >gv
vnoremap < <gv
