require('nvim-treesitter.configs').setup {
    -- These will be automatically installed
    ensure_installed = {
        'dockerfile',
        -- App stuff
        'dart',
        -- Web stuff
        'html', 'css', 'javascript',
        -- Serialized data files
        'json', 'toml', 'yaml',
        -- Scripting stuff
        'bash', 'lua', 'python', 'vim'
    },
    highlight = {
        enable = true,
        -- Using this option may slow down neovim
        additional_vim_regex_highlighting = false
    }
}
