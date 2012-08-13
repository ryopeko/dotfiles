
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-pathogen'
Bundle 'petdance/vim-perl'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'desert256.vim'
Bundle 'wombat256.vim'
Bundle 'molokai'

let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/proc.so'

syntax enable
filetype indent on
filetype plugin on

set ambiwidth=double
set autoindent
set autoread
set backspace=indent,eol,start
set showmode
set number
set ruler
set showmatch
set hlsearch
set noswapfile

set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%=%l,%c%v%8p

nmap <Esc><Esc> :nohlsearch<CR><Esc>
map <LEFT> <ESC>:bp<CR>
map <RIGHT> <ESC>:bn<CR>

set expandtab tabstop=2 shiftwidth=2

set t_Co=256
colorscheme wombat256mod

""" unite.vim
let g:unite_enable_start_insert=1
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')

au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

au BufReadPost,BufNewFile *.t :setl filetype=perl

highlight WideSpace ctermbg=blue guibg=blue
highlight EOLSpace ctermbg=red guibg=red

function! s:HighlightSpaces()
  syntax match WideSpace /　/ containedin=ALL
  syntax match EOLSpace /\s\+$/ containedin=ALL
endf

call s:HighlightSpaces()
autocmd VimEnter,WinEnter * call s:HighlightSpaces()

""autocmd InsertLeave * setlocal nocursorline
""autocmd InsertEnter * setlocal cursorline

augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline nocursorcolumn
  autocmd WinEnter,BufRead * set cursorline cursorcolumn
augroup END

hi clear CursorLine
hi clear CursorColumn
hi CursorLine gui=underline
highlight CursorColumn ctermbg=blue guibg=black
highlight CursorLine ctermbg=black guibg=black
