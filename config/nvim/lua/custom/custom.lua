local id = vim.api.nvim_create_augroup('location-list', {
    clear = true
})

--Quickfix list navigation
vim.api.nvim_create_autocmd({'BufEnter'}, {
    group = 'location-list',
    pattern = 'qf',
    desc = 'Location list navigation keybinds',
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        print(bufnr)
        vim.keymap.set('n', 'j', function()
            vim.fmd('lnext')
        end)

        vim.keymap.set('n', 'k', function()
            vim.cmd('lprev')
        end)

        vim.keymap.set('n', '<cr>', function()
            vim.cmd('lclose')
        end)
    end
})
