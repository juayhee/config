return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        { '<leader>ls', '<cmd>Oil --float<cr>', desc = 'oil: Open parent directory of current buffer' },
        { '<C-v>', '<cmd>lua require("oil.actions").select_vsplit.callback()<cr>' },
        { '<C-x>', '<cmd>lua require("oil.actions").select_split.callback()<cr>' },
        { '<leader>j', '<cmd>lua require("oil.actions").select.callback()<cr>' },
        { '<leader>k', '<cmd>lua require("oil.actions").parent.callback()<cr>' },
        { '<leader>p', '<cmd>lua require("oil.actions").preview.callback()<cr>' },
    },
}
