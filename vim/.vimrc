" Automatically wrap text that extends beyond the screen length.
set wrap

" Jump previous file
nnoremap <Leader>b :e#<Enter>

" Config airline
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled= 2

" Show lines after EOF
set scrolloff=10

" Show lines number
set relativenumber

" Turn on syntax highlighting.
syntax on

" Setup therme
colorscheme gruvbox
set background=dark

" Inherit indentation from previous lines
set autoindent

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Hide netrw banner
let g:netrw_banner = 0

" Force to show relative numbers at netrw
set updatetime=100
autocmd CursorHold * if (&filetype == 'netrw' && &number == 0) | set relativenumber | endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'michaeljsmith/vim-indent-object'
Plug 'ycm-core/YouCompleteMe'
Plug 'wincent/command-t'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'

call plug#end()

