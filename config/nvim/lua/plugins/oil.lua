return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        keymaps = {
            ['<C-v>'] = 'actions.select_vsplit',
            ['<C-s>'] = 'actions.select_split',
            ['<leader>p'] = 'actions.preview',
            ['<C-h>'] = false,
            ['<C-l>'] = false,
        },
        view_options = {
            show_hidden = true,
        }
    },
    config = function(_, opts)
        local oil = require('oil')
        vim.keymap.set('n', '<leader>ls', '<cmd>Oil<CR>', { desc = 'Open parent directory' })
        oil.setup(opts)
    end
}
