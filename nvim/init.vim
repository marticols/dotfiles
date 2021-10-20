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

" Autocomplete
set completeopt=menuone,noinsert,noselect

" Mappings
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
let g:ctrlp_map = '<leader>t'

" Plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ciaranm/detectindent'
Plug 'terryma/vim-multiple-cursors'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tpope/vim-fugitive'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'

call plug#end()

autocmd BufEnter * lua require'completion'.on_attach()

" LSP
lua << EOF


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local nvim_lsp = require('lspconfig')
local servers = { "dartls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

EOF
