" ensure vim-plug installed
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    " install vim-plug
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'itchyny/lightline.vim'
    Plug 'drewtempelmeyer/palenight.vim'

    " Always load the vim-devicons as the very last one.
    " Plug 'ryanoasis/vim-devicons'
call plug#end()

" template
" let g:airline_theme='deus'
" colorscheme palenight
" let g:lightline = { 'colorscheme': 'dark' }
let g:airline_theme = "luna"

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

" force encoding
set encoding=UTF-8

" Color extra whitespace
highlight ExtraWhitespace term=standout ctermfg=67 ctermbg=33
highlight Comment ctermfg=darkgrey

" remove useless whitespace in the end of lines
au BufNewFile,BufRead * :match ExtraWhitespace /\s\+$/
