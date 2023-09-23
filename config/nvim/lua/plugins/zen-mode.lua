return {
    'folke/zen-mode.nvim',
    config = function()
        require('zen-mode').setup({
            plugins = {
                kitty = {
                    enabled = true,
                    font = "+8",
                }
            }
        })
        vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<cr>', { desc = 'Toggle ZenMode' })
    end
}
