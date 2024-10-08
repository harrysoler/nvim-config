return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons", opts = {} },
	cmd = "Oil",
	event = { "VimEnter */*,.*", "BufNew */*,." },
	keys = {
		{ "-", "<cmd>Oil<cr>", mode = { "n" } },
	},
	opts = {
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["ñ"] = "actions.select",
			["<super>ñ"] = "actions.close",
		},
	},
}
