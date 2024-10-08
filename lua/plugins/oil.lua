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
			["<CR>"] = "actions.select",
			["<leader>ñ"] = "actions.close",
			["<leader>v"] = { "actions.select", opts = { vertical = true } },
			["<leader>h"] = { "actions.select", opts = { horizontal = true } },
			["<leader>p"] = "actions.preview",
			["<leader>l"] = "actions.refresh",
			["g?"] = "actions.show_help",
			["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
        use_default_keymaps = false,
	},
}
