"  Information
"  http://qiita.com/mfujimori/items/9fd41bcd8d1ce9170301
set number
set showcmd
set list
set listchars=tab:>-

syntax on
set cursorline

"  Search
"  http://kaworu.jpn.org/kaworu/2010-11-24-1.php
"  http://kaworu.jpn.org/kaworu/2010-11-21-1.php
set ignorecase
set smartcase
set incsearch
set wrapscan

"  Vimで行末の余分なスペースを取り除く - Qiita
"  http://qiita.com/mktakuya/items/2a6cd35ca0c1b217e28c
autocmd BufWritePre * :%s/\s\+$//ge

" Indentation
"  http://d.hatena.ne.jp/nzm_o/20100515/1273911397
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

"  Vimメモ : 挿入モードでバックスペースが効かない - もた日記
"  http://wonderwall.hatenablog.com/entry/2016/03/23/232634
set backspace=indent,eol,start

" 内容が変更されたら自動的に再読み込み
set autoread

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundles')
    call dein#begin('~/.vim/bundles')

    " Let dein manage dein
    " Required:
    call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('rust-lang/rust.vim')
    call dein#add('fatih/vim-go')
    call dein#add('leafgarland/typescript-vim')

    " You can specify revision/branch/tag.
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Plugin settings
" # rust
" ## auto rustfmt https://github.com/rust-lang/rust.vim#formatting-with-rustfmt
let g:rustfmt_autosave = 1

" # neocomplete & neosnippet
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" ## key-mappings
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "") . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-r>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" <SPACE>: completion.
" inoremap <expr><SPACE> pumvisible() ? "\<C-y>" : "\<SPACE>"

" Note: It must be "imap" and "smap". It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> pumvisible() ? "\<C-n>" :
            \ neosnippet#expandable_or_jumpable() ?
            \ "<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=1 concealcursor=
endif

" ## omni completion
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"End dein Scripts-------------------------

