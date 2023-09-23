local id = vim.api.nvim_create_augroup('location-list', {
    clear = true
})

-- Quickfix list navigation
vim.api.nvim_create_autocmd({'FileType'}, {
    group = 'location-list',
    pattern = 'qf',
    desc = 'Location list navigation keybinds',
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        vim.keymap.set('n', 'j', function()
            vim.cmd('cnext')
            vim.cmd('wincmd p')
        end, { buffer = 0 } )

        vim.keymap.set('n', 'k', function()
            vim.cmd('cprev')
            vim.cmd('wincmd p')
        end, { buffer = 0 })

        vim.keymap.set('n', '<cr>', function()
            vim.cmd('cclose')
            vim.cmd('wincmd p')
            vim.cmd('normal zz') -- Centre the selection upon returning
        end, { buffer = 0 })
    end
})
