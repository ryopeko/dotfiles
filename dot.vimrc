set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932

set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'https://github.com/pangloss/vim-javascript'
NeoBundle 'https://github.com/petdance/vim-perl'
NeoBundle 'https://github.com/Shougo/unite.vim'
NeoBundle 'https://github.com/Shougo/vimshell'
NeoBundle 'https://github.com/Shougo/vimproc'
NeoBundle 'https://github.com/Shougo/neocomplcache'
NeoBundle 'https://github.com/Shougo/neosnippet'
NeoBundle 'https://github.com/taka84u9/unite-git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/nathanaelkane/vim-indent-guides.git'
"NeoBundle 'wombat256.vim'

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

au BufNewFile,BufRead *.rb   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.sql  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.pl   set nowrap tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.pm   set nowrap tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.t    set nowrap tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.psgi set nowrap tabstop=4 shiftwidth=4 expandtab
"set expandtab tabstop=2 shiftwidth=2
"set expandtab ts=4 sw=4 nowrap ft=perl ff=unix

set t_Co=256
colorscheme wombat256mod

""" neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

""" unite.vim
let g:unite_enable_start_insert=1
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,r :<C-u>Unite file_mru<CR>
nnoremap <silent> ,g :<C-u>Unite git_modified<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')

au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

au BufReadPost,BufNewFile *.t :setl filetype=perl
au BufReadPost,BufNewFile *.psgi :setl filetype=perl

highlight WideSpace ctermbg=blue guibg=blue
highlight EOLSpace ctermbg=red guibg=red

""行末空白の自動削除
autocmd BufWritePre * :%s/\s\+$//ge

function! s:HighlightSpaces()
  syntax match WideSpace /　/ containedin=ALL
  syntax match EOLSpace /\s\+$/ containedin=ALL
endf

call s:HighlightSpaces()
autocmd VimEnter,WinEnter * call s:HighlightSpaces()

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

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
