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

"dein installer
let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Set Dein base path (required)
let s:dein_base = '~/.cache/dein'

" Set Dein source path (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Required:
if dein#load_state(s:dein_base)
    call dein#begin(s:dein_base)

    " Let dein manage dein
    " Required:
    call dein#add(s:dein_src)

    " Add or remove your plugins here:
    call dein#add('Shougo/ddc.vim')
    call dein#add('vim-denops/denops.vim')

    " Ddc UIs
    call dein#add('Shougo/ddc-ui-native')

    " Ddc sources
    call dein#add('Shougo/ddc-around')
    call dein#add('shun/ddc-vim-lsp')

    " Ddc filters
    call dein#add('tani/ddc-fuzzy')
    call dein#add('Shougo/ddc-matcher_head')
    call dein#add('Shougo/ddc-sorter_rank')

    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')

    call dein#add('prabirshrestha/vim-lsp')
    call dein#add('mattn/vim-lsp-settings')
    call dein#add('thomasfaingnaert/vim-lsp-snippets')
    call dein#add('thomasfaingnaert/vim-lsp-neosnippet')

    call dein#add('rust-lang/rust.vim')
    " call dein#add('fatih/vim-go')
    call dein#add('leafgarland/typescript-vim')
    call dein#add('editorconfig/editorconfig-vim')

    call dein#add('github/copilot.vim')

    " You can specify revision/branch/tag.
    " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

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
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['vim-lsp', 'around', 'neosnippet'])
call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
            \   'matchers': ['matcher_fuzzy'],
            \   'sorters': ['sorter_fuzzy'],
            \   'converters': ['converter_fuzzy'] },
            \ })

call ddc#custom#patch_global('sourceOptions', {
            \ 'around': {'mark': 'A'},
            \ })
call ddc#custom#patch_global('sourceOptions', {
            \ 'neosnippet': {'mark': 'ns', 'dup': v:true},
            \ })
call ddc#custom#patch_global('sourceOptions', {
            \ 'vim-lsp': {'mark': 'lsp', 'dup': v:true},
            \ })

call ddc#enable()

" # neosnippet
let g:neosnippet#snippets_directory = $HOME.'/.vim/neosnippet-snippets/snippets'

" Note: It must be "imap" and "smap". It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
            \ neosnippet#expandable_or_jumpable() ? "<Plug>(neosnippet_expand_or_jump)" :
            \ "\<TAB>"

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" :
            \ "\<S-TAB>"

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
let g:lsp_settings = {
            \     'efm-langserver': {
            \         'disabled': v:false,
            \     }
            \ }
let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'efm-langserver', 'deno', ]
let g:lsp_settings_filetype_typescriptreact = ['typescript-language-server', 'efm-langserver', 'deno', ]
let g:lsp_settings_filetype_javascript = ['typescript-language-server', 'efm-langserver', 'deno', ]

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <Plug>(lsp-definition)
    nmap <buffer> <F2> <Plug>(lsp-rename)
    nmap <buffer> K <Plug>(lsp-hover)
    nmap <buffer> ,d <Plug>(lsp-document-diagnostics)
    nmap <buffer> ,. <Plug>(lsp-code-action)
    nmap <buffer> ,f <Plug>(lsp-document-format)
    nmap <buffer> ]e <Plug>(lsp-next-error)
    nmap <buffer> [e <Plug>(lsp-previous-error)
    nmap <buffer> ]d <Plug>(lsp-next-diagnostic)
    nmap <buffer> [d <Plug>(lsp-previous-diagnostic)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.ts,*.js LspDocumentFormatSync
endfunction

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"End dein Scripts-------------------------

