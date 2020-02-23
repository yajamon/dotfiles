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
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#add('prabirshrestha/async.vim')
    call dein#add('prabirshrestha/vim-lsp')

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

" # vim-lsp
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust']
        \ })
endif
if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif


" # deoplete
let g:deoplete#enable_at_startup = 1

" ## key-mappings
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "") . "\<CR>"
endfunction
" <TAB>: completion.
" <C-r>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
" <SPACE>: completion.
" inoremap <expr><SPACE> pumvisible() ? "\<C-y>" : "\<SPACE>"

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

"End dein Scripts-------------------------

