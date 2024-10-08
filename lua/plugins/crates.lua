return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	dependencies = "hrsh7th/nvim-cmp",
	config = function()
		require("crates").setup({
			completion = {
				crates = {
					enabled = true,
					max_results = 8,
					min_chars = 3,
				},
				cmp = {
					enabled = true,
				},
			},
		})
		require("cmp").setup.buffer({ sources = { { name = "crates" } } })
	end,
}
