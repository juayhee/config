return {
    'nvim-focus/focus.nvim',
    config = function()
        local focus = require('focus')
        focus.setup()

        -- Keymaps
        vim.keymap.set('n', '<leader>wm', '<cmd>FocusMaximise<cr>', { desc = 'Toggle window maximisation' })
        vim.keymap.set('n', '<leader>wr', '<cmd>FocusAutoresize<cr>', { desc = 'Autoresize windows' })
    end
}
