return {
    'chentoast/marks.nvim',
    config = function()
        require('marks').setup()

        -- Keymaps
        vim.keymap.set('n', '<leader>m', '<cmd>MarksListBuf<cr>', { desc = 'List marks in current buffer' })
    end
}
