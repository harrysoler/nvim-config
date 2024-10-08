local cmp = require("cmp")
local luasnip = require("luasnip")

local function travel_next_expansion()
	if luasnip.expand_or_locally_jumpable() then
		luasnip.expand_or_jump()
	end
end

local function travel_prev_expansion()
	if luasnip.locally_jumpable() then
		luasnip.jump(-1)
	end
end

return cmp.mapping.preset.insert({
	["<Tab>"] = cmp.mapping.select_next_item(),
	["<S-Tab>"] = cmp.mapping.select_prev_item(),

	["<CR>"] = cmp.mapping.confirm({ select = true }),

	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),

	-- Trigger completion
	["<C-Space>"] = cmp.mapping.complete({}),

	-- Travel through expansions
	["<C-l>"] = cmp.mapping(travel_next_expansion, { "i", "s" }),
	["<C-h>"] = cmp.mapping(travel_prev_expansion, { "i", "s" }),
})
