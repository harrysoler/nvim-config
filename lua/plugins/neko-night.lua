return {
	"neko-night/nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("nekonight-deep-ocean")
	end,
}
