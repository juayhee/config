return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = true,
	config = function () 
		local configs = require("nvim-treesitter.configs")
		
		configs.setup({
		ensure_installed = { "c", "cpp", "lua", "vim" },
		sync_install = false,
		highlight = { enable = true,
		additional_vim_regex_highlighting = false
	},
		indent = { enable = true },  
	})
end
}
