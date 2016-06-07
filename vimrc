syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
highlight ExtraWhitespace term=standout ctermfg=67 ctermbg=33
au BufNewFile,BufRead * :match ExtraWhitespace /\s\+$/
