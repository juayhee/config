-- Toggle LSP diagnostics

vim.g.diagnostic_on = 0

vim.keymap.set('n', '<leader>d', function()
    if vim.g.diagnostic_on == 1 then
        vim.g.diagnostic_on = 0
        vim.diagnostic.config({ virtual_text = false})
    elseif vim.g.diagnostic_on == 0 then
        vim.g.diagnostic_on = 1
        vim.diagnostic.config({ virtual_text = true})
    end
end, { desc = 'Toggle LSP diagnostics text' })
