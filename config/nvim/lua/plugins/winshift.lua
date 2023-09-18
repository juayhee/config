return {
    'sindrets/winshift.nvim',
    config = function()
        local winshift = require('winshift')
        vim.keymap.set('n','<leader>w', '<cmd>WinShift<cr>', { desc = 'WinShift: Enter Win-Move mode' })
        winshift.setup()
    end
}
