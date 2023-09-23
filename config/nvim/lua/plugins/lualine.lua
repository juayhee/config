return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local kanagawa = require('lualine.themes.kanagawa') -- Located in kanagawa.nvim folder but added to rtp by Lazy
        require('lualine').setup {
            options = { theme = kanagawa },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'diff'},
                lualine_c = {'diagnostics'},
                lualine_x = {'filename'},
                lualine_y = {'location'},
                lualine_z = {'branch'},
            }
        }
    end
}
