return {
    'chentoast/marks.nvim',
    config = function()
        local marks = require('marks')
        marks.setup()

        -- Keymaps
        vim.keymap.set('n', '<leader>m', '<cmd>MarksListBuf<cr>', { desc = 'List marks in current buffer' })
    end
}
