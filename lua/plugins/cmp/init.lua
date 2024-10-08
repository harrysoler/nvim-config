local function is_make_unsupported()
	return vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0
end

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Extra capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",

		-- Snnippets support
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if is_make_unsupported() then
					return
				end
				return "make install_jsregexp"
			end)(),
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu.menuone.noinsert" },
			mapping = require("plugins.cmp.mappings"),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{
					name = "buffer",
					option = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end,
					},
				},
			},
		})
	end,
}
