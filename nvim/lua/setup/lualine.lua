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
        lualine_x = {'encoding'},
        lualine_y = {'fileformat'}
    }
}
