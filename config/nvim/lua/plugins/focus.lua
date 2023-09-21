return {
    'nvim-focus/focus.nvim',
    config = function()
        local focus = require('focus')
        focus.setup()

        -- Keymaps
        vim.keymap.set('n', '<leader>we', '<cmd>FocusEqualise<cr>', { desc = 'Equalise windows' })
        vim.keymap.set('n', '<leader>wr', '<cmd>FocusAutoresize<cr>', { desc = 'Autoresize windows' })
        vim.keymap.set('n', '<leader>ww', '<cmd>FocusMaximise<cr>', { desc = 'Maximise current window' })
    end
}
