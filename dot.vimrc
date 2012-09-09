set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932

set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'pangloss/vim-javascript'
NeoBundle 'petdance/vim-perl'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'wombat256.vim'

let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/proc.so'

syntax enable
filetype indent on
filetype plugin on

if neobundle#exists_not_installed_bundles()
 echomsg 'Not installed bundles : ' .
       \ string(neobundle#get_not_installed_bundle_names())
 echomsg 'Please execute ":NeoBundleInstall" command.'
endif

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
nnoremap <silent> ,r :<C-u>Unite file_mru<CR>

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
