local clear_autocmds = vim.api.nvim_clear_autocmds
local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local lsp = vim.lsp

return function(client, event)
    if client and client:supports_method('textDocument/documentHighlight') then
        local highlight_augroup = autogroup("lsp_highlight", { clear = false })

        autocmd({ "CursorHold", "CursorHoldI" }, {
            group = highlight_augroup,
            buffer = event.buf,
            callback = lsp.buf.document_highlight,
        })

        autocmd({ "CursorMoved", "CursorMovedI" }, {
            group = highlight_augroup,
            buffer = event.buf,
            callback = lsp.buf.clear_references,
        })

        autocmd("LspDetach", {
            group = autogroup("lsp_detach", { clear = true }),
            callback = function(detach_event)
                lsp.buf.clear_references()
                clear_autocmds({
                    group = "lsp_highlight",
                    buffer = detach_event.buf,
                })
            end,
        })
    end
end
