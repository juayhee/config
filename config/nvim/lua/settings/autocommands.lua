local diff = vim.api.nvim_create_augroup('diff', {
    clear = true,
})

vim.api.nvim_create_autocmd({ 'BufNew', 'BufEnter' }, {
    callback = function()
        if vim.api.nvim_get_option_value('diff', {}) then
            vim.keymap.set('n', 'g', function()
                vim.cmd('diffget')
            end, { desc = 'diffget', buffer = 0 })

            vim.keymap.set('n', 'p', function()
                vim.cmd('diffput')
            end, { desc = 'diffput', buffer = 0 })
        else

        end
    end,
    group = 'diff'
})
