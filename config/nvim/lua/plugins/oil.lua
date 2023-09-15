return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        keymaps = {
            ['<C-v>'] = 'actions.select_vsplit',
            ['<C-x>'] = 'actions.select_split',
            ['<leader>j'] = 'actions.select',
            ['<leader>k'] = 'actions.parent',
            ['<leader>p'] = 'actions.preview',
            ['<C-h>'] = false,
            ['<C-l>'] = false
        },
        float = {
            max_width = 40,
            max_height = 64,
        }
    },
    config = function(_, opts)
        local oil = require('oil')
        vim.keymap.set('n', '<leader>ls', function() oil.toggle_float() end)
        oil.setup(opts)
    end
}
