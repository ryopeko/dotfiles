call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932

set nocompatible
syntax enable
filetype on
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
colorscheme mrkn256

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i

au BufReadPost,BufNewFile *.t :setl filetype=perl

highlight WideSpace ctermbg=blue guibg=blue
highlight EOLSpace ctermbg=red guibg=red

function! s:HighlightSpaces()
  syntax match WideSpace /　/ containedin=ALL
  syntax match EOLSpace /\s\+$/ containedin=ALL
endf

call s:HighlightSpaces()
autocmd VimEnter,WinEnter * call s:HighlightSpaces()

autocmd InsertLeave * setlocal nocursorline
autocmd InsertEnter * setlocal cursorline


