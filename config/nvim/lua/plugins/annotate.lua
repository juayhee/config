return {
    'winter-again/annotate.nvim',
    dependencies = { 'kkharji/sqlite.lua' },
    config = function()
        local annotate = require('annotate')
        annotate.setup()

        -- Keymaps
        vim.keymap.set('n', '<leader>aa', annotate.create_annotation, { desc = 'Create annotation' }) 
        vim.keymap.set('n', '<leader>ad', annotate.delete_annotation, { desc = 'Delete annotation' })
    end
}
