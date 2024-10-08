local clear_autocmds = vim.api.nvim_clear_autocmds
local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local lsp = vim.lsp

local function is_highlight_hint_supported(client)
	return client.supports_method(lsp.protocol.Methods.textDocument_documentHighlight)
end

return function(client, event)
	if client and is_highlight_hint_supported then
		local highlight_augroup = autogroup("kickstart-lsp-highlight", { clear = false })

		autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = lsp.buf.document_highlight,
		})

		autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = lsp.buf.clear_references,
		})

		autocmd("LspDetach", {
			group = autogroup("kickstart-lsp-detach", { clear = true }),
			callback = function(detach_event)
				lsp.buf.clear_references()
				clear_autocmds({
					group = "kickstart-lsp-highlight",
					buffer = detach_event.buf,
				})
			end,
		})
	end
end
