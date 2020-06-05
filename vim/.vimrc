" Automatically wrap text that extends beyond the screen length.
set wrap

" Disable swapfile
set noswapfile
set nobackup

" Share clipboard [OSX]
set clipboard=unnamed

" Delete directories with rm
let g:netrw_rmdir_cmd='rm -r'

" Ignore node_modules files with command-t
set wildignore+=*/node_modules/*,*.pyc,__init__.py

" Enable lightline
set laststatus=2

" Show lines after EOF
set scrolloff=10

" Show lines number
set relativenumber
set nu rnu

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

" Detect indent automatically
autocmd CursorHold * DetectIndent

" Linters
let g:ale_linters = {
\   'python': ['pyls'],
\   'vue': ['eslint'],
\}

" Fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\   'vue': ['eslint'],
\}

let g:ale_fix_on_save = 1

let g:ale_completion_enabled = 1

" Map leader to space
let mapleader = " "

" Mappings
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>b :e#<Enter>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'digitaltoad/vim-pug'
Plug 'ciaranm/detectindent'
Plug 'wincent/command-t'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

call plug#end()
