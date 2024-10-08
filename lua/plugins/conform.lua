local function format()
	require("conform").format({ async = true })
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{ "<leader>cf", format, mode = "" },
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			["_"] = { "trim_whitespace" },
		},
		default_format_opts = {
			async = true,
			lsp_format = "fallback",
			timeout_ms = 500,
		},
	},
	config = function(_, opts)
		-- Format range gq
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		require("conform").setup(opts)
	end,
}
