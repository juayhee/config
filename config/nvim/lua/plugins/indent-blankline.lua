return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        -- require("ibl").setup {
        --     space_char_blankline = " ",
        --     show_current_context = true,
        -- }
        
        -- Highlights for indent line
        vim.cmd('highlight IblIndent guifg=#282727')

        -- Highlights for indent line in current context
        vim.cmd('highlight IblScope guifg=#b98d7b')

        require('ibl').setup {
            scope = {
                show_start = false,
                show_end = false,
            }
        }
        
       
    end
}
