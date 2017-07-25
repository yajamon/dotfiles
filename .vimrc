"  Information
set number
set showcmd
set list
set listchars=tab:>-

"  http://qiita.com/mfujimori/items/9fd41bcd8d1ce9170301

syntax on
set cursorline

"  Search
set ignorecase
set smartcase
set incsearch
set wrapscan

"  http://kaworu.jpn.org/kaworu/2010-11-24-1.php
"  http://kaworu.jpn.org/kaworu/2010-11-21-1.php

autocmd BufWritePre * :%s/\s\+$//ge

"  Vimで行末の余分なスペースを取り除く - Qiita
"  http://qiita.com/mktakuya/items/2a6cd35ca0c1b217e28c
