local lsp = vim.lsp

local function is_inlay_hint_supported(client, event)
    return require("plugins.lsp.client_supports_method")(
        client, 
        vim.lsp.protocol.Methods.textDocument_inlayHint, 
        event.buf
    )
end

local function map(keys, func, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func)
end

return function(client, event)
	if client and is_inlay_hint_supported(client, event) then
		map("<leader>th", function()
			lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled { bufnr = event.buf })
		end)
	end
end
