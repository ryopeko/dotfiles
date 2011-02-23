call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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

set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%=%l,%c%v%8p

set expandtab tabstop=2 shiftwidth=2

highlight WideSpace ctermbg=blue guibg=blue
highlight EOLSpace ctermbg=red guibg=red

function! s:HighlightSpaces()
	syntax match WideSpace /　/ containedin=ALL
	syntax match EOLSpace /\s\+$/ containedin=ALL
endf

call s:HighlightSpaces()
autocmd VimEnter,WinEnter * call s:HighlightSpaces()
