return {
    'echasnovski/mini.nvim',
    config = function()
        require('mini.comment').setup()
        require('mini.sessions').setup()
    end

}
