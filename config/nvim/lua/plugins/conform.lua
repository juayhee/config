return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require('conform')
        conform.setup({
            formatters_by_ft = {
                cpp = { 'clang_format' },
                cmake = { 'cmake_format' },
            }
        })

        vim.keymap.set('n', '<leader>gf', function()
            conform.format({
                async = true,
                lsp_fallback = true
            })
        end, { desc = 'Format with Conform' })
    end
}
