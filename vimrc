" Turn on Syntax Highlighting
syntax on

" active auto indentation
filetype plugin indent on

" size of tab
set tabstop=4

" convert tab to space
set shiftwidth=4

" Color extra whitespace
highlight ExtraWhitespace term=standout ctermfg=67 ctermbg=33

" remove useless whitespace in the end of lines
au BufNewFile,BufRead * :match ExtraWhitespace /\s\+$/
