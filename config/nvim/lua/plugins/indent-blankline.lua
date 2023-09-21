return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require('indent_blankline').setup()

        -- Keymaps
        vim.keymap.set('n', '<leader>l', '<cmd>IndentBlanklineToggle<cr>', { desc = 'Show indent lines' })
    end
}

