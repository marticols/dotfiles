" Automatically wrap text that extends beyond the screen length.
set wrap

" Show lines number
set relativenumber

" Turn on syntax highlighting.
syntax on

" Setup therme
colorscheme gruvbox
set background=dark

" Inherit indentation from previous lines
set autoindent

" Detect indentation of the file
autocmd CursorHold * DetectIndent

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

Plug 'digitaltoad/vim-pug'
Plug 'michaeljsmith/vim-indent-object'
Plug 'ciaranm/detectindent'
Plug 'ycm-core/YouCompleteMe'
Plug 'wincent/command-t'
Plug 'morhetz/gruvbox'

call plug#end()
