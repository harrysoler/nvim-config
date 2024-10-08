return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons", opts = {} },
	keys = {
		{ "<leader>sf", "<cmd>FzfLua files<cr>" },
		{ "<leader>sg", "<cmd>FzfLua live_grep<cr>" },
		{ "<leader>sb", "<cmd>FzfLua buffers<cr>" },
	},
	opts = {},
}
