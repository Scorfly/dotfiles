" Turn on Syntax Highlighting
syntax on

" active auto indentation
filetype plugin indent on

" size of tab
set tabstop=4

" convert tab to space
set expandtab
set shiftwidth=4

" highlight searched terms
set hlsearch

" config mouse
set mouse=v

" toogle paste mode
" --- it permit to paste without auto indent/comment
set pastetoggle=<F9>

" Color extra whitespace
highlight ExtraWhitespace term=standout ctermfg=67 ctermbg=33
highlight Comment ctermfg=darkgrey

" remove useless whitespace in the end of lines
au BufNewFile,BufRead * :match ExtraWhitespace /\s\+$/
