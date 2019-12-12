" Automatically wrap text that extends beyond the screen length.
set wrap

" Status bar
set laststatus=2

" Show lines number
set number

" Turn on syntax highlighting.
syntax on

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'

call plug#end()
