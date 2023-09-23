return {
    'crusj/bookmarks.nvim',
    keys = {
        { "<tab><tab>" },
        { '<leader>mm' },
    },
    branch = 'main',
    dependencies = { 'nvim-web-devicons', 'nvim-telescope/telescope.nvim' },
    config = function()
        local bookmarks = require('bookmarks')
        bookmarks.setup(
            {
                keymap = {
                    add = '<leader>mm',
                    delete_on_virt = '<leader>md',
                    show_desc = '<leader>ms',
                }
            })
    end
}
