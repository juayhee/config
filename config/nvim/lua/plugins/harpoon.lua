return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local harpoon = require('harpoon')
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        -- Harpoon keymaps
        vim.keymap.set('n', '<leader>nn', mark.add_file, { desc = 'Harpoon a file' })
        vim.keymap.set('n', '<leader>nm', ui.toggle_quick_menu, { desc = 'Show Harpoons' })
        vim.keymap.set('n', '<leader>n1', function() ui.nav_file(1) end, { desc = 'Jump to Harpoon 1' })
        vim.keymap.set('n', '<leader>n2', function() ui.nav_file(2) end, { desc = 'Jump to Harpoon 2' })
        vim.keymap.set('n', '<leader>n3', function() ui.nav_file(3) end, { desc = 'Jump to Harpoon 3' })
    end
}
