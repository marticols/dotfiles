require('lualine').setup {
    options = {
        -- Disable seperators
        section_separators = '',
        component_separators = '',
        -- Set the statusline theme
        theme = 'tokyonight'
    },
    -- Change components
    sections = {
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_lsp' }
            }
        },
        lualine_y = {'fileformat'}
    }
}
