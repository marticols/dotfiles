set termguicolors
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
let g:ctrlp_map = '<leader>t'
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent>D :Lspsaga show_line_diagnostics<CR>

" Plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'ciaranm/detectindent'
Plug 'terryma/vim-multiple-cursors'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-fugitive'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

call plug#end()

" Set colorscheme
let g:tokyonight_style = "night"
colorscheme tokyonight
let g:lightline = {'colorscheme': 'tokyonight'}

lua << EOF

-- Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

-- lspsaga
local saga = require 'lspsaga'
saga.init_lsp_saga{
  error_sign = '',
  warn_sign = '',
  code_action_prompt = {
    enable = false,
  },
}

-- LSP
local nvim_lsp = require'lspconfig'

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'dartls',}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

EOF
