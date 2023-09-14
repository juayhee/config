return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzf-native.nvim' },
    keys = {
        { '<leader>ff', function() require('telescope.builtin').find_files() end },
        { '<leader>fs', function() require('telescope.builtin').live_grep() end },
        { '<leader>fr', function() require('telescope.builtin').resume() end }
    },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = 'vertical'
            }
        })
    end
}

