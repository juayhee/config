return {
	'nvim-telescope/telescope.nvim', tag = '0.1.2',
	dependencies = { 'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope-fzf-native.nvim' },
	keys = {
		{ '<leader>ff', function() require('telescope.builtin').find_files() end  },
	},
}

