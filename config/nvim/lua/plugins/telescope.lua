return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')
        local utils = require('telescope.utils')

        require('telescope').setup({
            defaults = {
                layout_strategy = 'vertical',
                -- Keymaps in Telescope buffer
                mappings = {
                    i = {
                        -- Disable moving around the telescope buffer in insert
                        ['<tab>'] = false,
                    },
                    n = {
                        ['<C-w>s'] = actions.select_horizontal,
                        ['<C-w>v'] = actions.select_vertical,
                        ['<Tab>'] = actions.toggle_selection,
                        ['<leader>fq'] = actions.send_to_qflist + actions.open_qflist,
                        ['<leader>fw'] = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                }
            }
        })

        -- Global keymaps
        -- Lazy load on triggering these keys
        vim.keymap.set('n', '<leader>fF', function()
            builtin.find_files({
                hidden = true,
                no_ignore = true
            })
        end, {
            desc = 'All-file file search',
        })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '.gitignore aware file search' })
        vim.keymap.set('n', '<leader>fG', builtin.live_grep, { desc = 'Global grep' })
        vim.keymap.set('n', '<leader>fg', function()
            builtin.live_grep({
                grep_open_files = true -- Only search in the current buffer
            })
        end, { desc = 'grep in open files' })
        vim.keymap.set('n', '<leader>fl', builtin.current_buffer_fuzzy_find, { desc = 'Local fuzzy-find' })
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Open previous search' })
    end
}
