return {
    'chentoast/marks.nvim',
    config = function()
        require('marks').setup{
            mappings = {
                annotate = '<leader>ma',
            }
        }

        -- Keymaps
        vim.keymap.set('n', '<leader>mm', '<cmd>MarksListBuf<cr>', { desc = 'List marks in current buffer' })
        vim.keymap.set('n', '<leader>m1', '<cmd>BookmarksList 1<cr>', { desc = 'List bookmark group 1' })
        vim.keymap.set('n', '<leader>m2', '<cmd>BookmarksList 2<cr>', { desc = 'List bookmark group 2' })
        vim.keymap.set('n', '<leader>m3', '<cmd>BookmarksList 3<cr>', { desc = 'List bookmark group 3' })
    end
}
