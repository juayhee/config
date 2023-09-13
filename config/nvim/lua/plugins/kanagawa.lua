return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	-- Run when LazyVim loads
	config = function()
		vim.cmd([[colorscheme kanagawa]])
	end
}
