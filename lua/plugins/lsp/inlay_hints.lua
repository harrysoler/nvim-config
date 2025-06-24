local lsp = vim.lsp

local function map(keys, func, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func)
end

return function(client, event)
	if client and client:supports_method('textDocument/inlayHint') then
		map("<leader>th", function()
			lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled, { bufnr = event.buf })
		end)
	end
end
