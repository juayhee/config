return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = true,
	keys = {
		{ "<leader>hm", '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = 'Mark file with harpoon' },
		{ "<leader>hn", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = 'Toggle Harpoon menu' },
		{ "<leader>hj", '<cmd>lua require("harpoon.ui").nav_next()<cr>', desc = 'Go to next harpoon mark' },
		{ "<leader>hk", '<cmd>lua require("harpoon.ui").nav_prev()<cr>', desc = 'Go to previous harpoon mark' },
	},
}
