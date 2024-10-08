local lsp = vim.lsp

local function is_inlay_hint_supported(client)
	return client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint)
end

local function map(keys, func, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func)
end

return function(client, event)
	if client and is_inlay_hint_supported(client) then
		map("<leader>th", function()
			lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
		end)
	end
end
