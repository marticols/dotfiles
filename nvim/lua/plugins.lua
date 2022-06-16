local packer = require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      requires = {'nvim-lua/plenary.nvim'}
    }
    -- autodetect indentation
    use 'tpope/vim-sleuth'
    -- git
    use 'tpope/vim-fugitive'
    -- highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- apperance
    use 'kyazdani42/nvim-web-devicons'
    use 'folke/tokyonight.nvim'
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- lsp
    use 'neovim/nvim-lspconfig'
    -- autocompletion
    -- more info: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
end)

require('setup.tokyonight')
require('setup.treesitter')
require('setup.telescope')
require('setup.lualine')
require('setup.lsp')

return packer
