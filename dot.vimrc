set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932

set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'pangloss/vim-javascript'
NeoBundle 'petdance/vim-perl'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'roalddevries/yaml.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'taka84u9/unite-git'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'sorah/unite-ghq'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'wombat256.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'c9s/perlomni.vim'
NeoBundle 'rking/ag.vim'

syntax enable
filetype indent on
filetype plugin on

if neobundle#exists_not_installed_bundles()
 echomsg 'Not installed bundles : ' .
       \ string(neobundle#get_not_installed_bundle_names())
 echomsg 'Please execute ":NeoBundleInstall" command.'
endif

call neobundle#end()

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
set ignorecase

set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%=%l,%c%v%8p

nmap <Esc><Esc> :nohlsearch<CR><Esc>
map <LEFT> <ESC>:bp<CR>
map <RIGHT> <ESC>:bn<CR>

au BufNewFile,BufRead *.sql  set nowrap tabstop=2 shiftwidth=2

au BufNewFile,BufRead *.js     set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.json   set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.coffee set tabstop=2 shiftwidth=2 expandtab

au BufNewFile,BufRead *.scss set tabstop=2 shiftwidth=2 expandtab

au BufNewFile,BufRead Gemfile  set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.watchr set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.rb     set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.rake   set tabstop=2 shiftwidth=2 expandtab

au BufNewFile,BufRead *.yaml set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.yml  set tabstop=2 shiftwidth=2 expandtab

au BufNewFile,BufRead *.erb set tabstop=2 shiftwidth=2 expandtab

au BufNewFile,BufRead *.pl set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.pm set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.t  set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.tt  set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.psgi set nowrap tabstop=4 shiftwidth=4 expandtab
"set expandtab tabstop=2 shiftwidth=2
"set expandtab ts=4 sw=4 nowrap ft=perl ff=unix

let g:Powerline_symbols = 'fancy'
set t_Co=256
colorscheme wombat256

""" neocomplete

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" neosnippet
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

""" unite.vim
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,r :<C-u>Unite file_mru<CR>
nnoremap <silent> ,o :<C-u>Unite outline<CR>
nnoremap <silent> ,q :<C-u>Unite ghq<CR>
nnoremap <silent> ,g :<C-u>Unite grep: -buffer-name=search-buffer<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,cog :<C-u>Unite grep: -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,rg :<C-u>UniteResume search-buffer<CR>
nnoremap <silent> ,gs :<C-u>Unite git_modified<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')

au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

au BufReadPost,BufNewFile Gemfile :setl filetype=ruby
au BufReadPost,BufNewFile *.watchr  :setl filetype=ruby
au BufReadPost,BufNewFile *.t :setl filetype=perl
au BufReadPost,BufNewFile *.tt :setl filetype=html
au BufReadPost,BufNewFile *.psgi :setl filetype=perl

highlight WideSpace ctermbg=blue guibg=blue
highlight EOLSpace ctermbg=red guibg=red

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

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component_function': {
      \   'filename': 'FilepathString'
      \ }
   \ }

function! FilepathString()
  if '' != expand('%:p')
    if stridx(expand('%:p'), expand('~')) == 0
      return substitute(expand('%:p'), expand('~'), '~', '')
    else
      return expand('%:p')
    endif
  else
    return '[No Name]'
  endif
endfunction

nnoremap <silent> ,m :OverCommandLine<CR>%s/
