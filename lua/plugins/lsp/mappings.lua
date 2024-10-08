local lsp = vim.lsp
local fzf = require("fzf-lua")

local function map(keys, func, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func)
end

-- Jump to definition
map("gd", fzf.lsp_definitions)
-- Rename variable
map("<leader>rn", lsp.buf.rename)

map("<leader>ca", lsp.buf.code_action)
