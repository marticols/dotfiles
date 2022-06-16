require('lualine').setup {
    options = {
        -- Set the statusline theme
        theme = 'tokyonight'
    },
    -- Change components
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', { 'diagnostics', sources = { 'nvim_lsp' } } },
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
    }
}
