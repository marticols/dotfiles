" Automatically wrap text that extends beyond the screen length.
set wrap

" Disable swapfile
set noswapfile
set nobackup

" Share clipboard [OSX]
set clipboard=unnamed

" Enable lightline
set laststatus=2

" Show lines number
set relativenumber
set nu rnu

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Hide netrw banner
let g:netrw_banner = 0

" Force to show relative numbers at netrw
set updatetime=100
autocmd CursorHold * if (&filetype == 'netrw' && &number == 0) | set relativenumber | endif

" Turn on syntax highlighting.
autocmd vimenter * colorscheme gruvbox
syntax on

" Detect indent automatically
autocmd CursorHold * DetectIndent

" Map leader to space
let mapleader = " "

" Files to ignore with fuzzy finder
set wildignore+=*/node_modules/*,*.pyc,__init__.py

" Mappings
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>d :ALEGoToDefinitionInTab<CR>
nnoremap <leader>r :ALEFindReferences<CR>
let g:ctrlp_map = '<leader>t'
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Ale
let g:ale_linters = {
\   'python': ['pyls'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'python': ['autopep8'],
\   'vue': ['prettier', 'eslint'],
\}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
set completeopt+=noinsert

" Plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'yggdroot/indentline'
Plug 'ciaranm/detectindent'
Plug 'terryma/vim-multiple-cursors'
Plug 'dense-analysis/ale'
Plug 'dart-lang/dart-vim-plugin'
Plug 'tpope/vim-fugitive'

call plug#end()
