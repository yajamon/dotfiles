set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932

"  Information
"  http://qiita.com/mfujimori/items/9fd41bcd8d1ce9170301
set number
set showcmd
set list
set listchars=tab:>-

syntax on
set cursorline

" ColorScheme
colorscheme molokai

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
    call dein#add('Shougo/ddc.vim')
    call dein#add('vim-denops/denops.vim')

    " Ddc sources
    call dein#add('Shougo/ddc-around')

    " Ddc filters
    call dein#add('Shougo/ddc-sorter_rank')

    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')

    call dein#add('prabirshrestha/async.vim')
    call dein#add('prabirshrestha/vim-lsp')
    call dein#add('mattn/vim-lsp-settings')
    call dein#add('thomasfaingnaert/vim-lsp-snippets')
    call dein#add('thomasfaingnaert/vim-lsp-neosnippet')

    call dein#add('rust-lang/rust.vim')
    call dein#add('fatih/vim-go')
    call dein#add('leafgarland/typescript-vim')
    call dein#add('editorconfig/editorconfig-vim')

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

" # ddc
" ## DDC global settings
call ddc#custom#patch_global('sources', ['around'])
call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
            \   'sorters': ['sorter_rank'] },
            \ })

call ddc#custom#patch_global('sourceOptions', {
            \ 'around': {'mark': 'A'},
            \ })

call ddc#enable()

" # neosnippet
let g:neosnippet#snippets_directory = $HOME.'/.vim/neosnippet-snippets/snippets'

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

" # vim-lsp-settings
let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server']

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <Plug>(lsp-definition)
    nmap <buffer> <F2> <Plug>(lsp-rename)
    nmap <buffer> K <Plug>(lsp-hover)
    nmap <buffer> ,d <Plug>(lsp-document-diagnostics)
    nmap <buffer> ,. <Plug>(lsp-code-action)
    nmap <buffer> ]e <Plug>(lsp-next-diagnostic)
    nmap <buffer> [e <Plug>(lsp-previous-diagnostic)

    autocmd BufWritePre *.rs,*.ts,*.js LspDocumentFormatSync
endfunction

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"End dein Scripts-------------------------

