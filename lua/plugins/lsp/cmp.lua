local lsp = vim.lsp

-- local function get_all_server_names(configured_servers, default_servers)
--     local ensure_installed = vim.tbl_keys(configured_servers or {})
--     vim.list_extend(ensure_installed, default_servers.servers or {})
--     vim.list_extend(ensure_installed, default_servers.tools or {})
--
--     return ensure_installed
-- end

return function(servers, opts)
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    -- local ensure_installed = get_all_server_names(configured_servers, default_servers)

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, opts.servers or {})
    vim.list_extend(ensure_installed, opts.tools or {})

    require('mason-tool-installer').setup {
        ensure_installed = ensure_installed,
        auto_update = true,
    }

	local common_handlers = {
		["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" }),
		["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded" }),
	}

    require("mason-lspconfig").setup {
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
            function(server_name)
                local server = servers[server_name] or {}

                server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                require("lspconfig")[server_name].setup(server)
            end,
        },
    }

    require("lspconfig.ui.windows").default_options.border = "rounded"
end
