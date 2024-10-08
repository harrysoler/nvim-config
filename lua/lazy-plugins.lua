-- Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins.lsp.init" },
	{ import = "plugins.cmp.init" },
	{ import = "plugins" },
}, {
	defaults = { lazy = true },
	performance = {
		cache = { enabled = true },
		rtp = {
			disabled_plugins = {
				"netrwPlugin",
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	debug = false,
})
