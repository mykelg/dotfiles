" display setting
syntax on
set number
set title

" color scheme setting
set t_Co=256
colorscheme molokai
let g:molokai_original=1

" print 80 column line
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

set tabstop=2
set autoindent
set shiftwidth=2
set expandtab

set incsearch
set hlsearch

" clang-format for Ubuntu
map <C-I> :pyf /usr/share/vim/addons/syntax/clang-format-3.4.py<cr>
imap <C-I> <C-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.4.py<cr>

" clang-format for Mac
" map <C-K> :pyf /usr/local/share/clang/clang-format.py<cr>
" imap <C-K> <c-o>:pyf /usr/local/share/clang/clang-format.py<cr>

" netrw
" set nocompatible
" filetype plugin on

" Load settings for each location.
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

" gtags
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

"
" plugged
"
call plug#begin('~/.vim/plugged')

" FixWhitespace
Plug 'bronson/vim-trailing-whitespace'

" Ag
Plug 'rking/ag.vim'
" --- type ° to search the word in all files in the current dir
nmap \| :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

" gitgutter
Plug 'airblade/vim-gitgutter'
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

" git-fugitive
Plug 'tpope/vim-fugitive'

" Easy align
Plug 'junegunn/vim-easy-align'
" interactive
vnoremap <silent> <Enter> :EasyAlign<cr>

" vim-alter (toggle header/source file)
Plug 'kana/vim-altr'
" nmap <F2> <Plug>(altr-forward)
" call altr#remove_all()
" call altr#define('%/include/%.h', '%/src/%.cc', '%/src/%-priv.h')

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()

