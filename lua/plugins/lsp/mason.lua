local lsp = vim.lsp

local function get_capabilities()
	local capabilities = lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
	capabilities.workspace.fileOperations = { didRename = true, willRename = true }

	return capabilities
end

return function(servers, opts)
	local capabilities = get_capabilities()
	require("mason").setup()

	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, opts.servers or {})
	vim.list_extend(ensure_installed, opts.tools or {})

	require("mason-tool-installer").setup({
		ensure_installed = ensure_installed,
		auto_update = true,
	})

	local common_handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
	}

	require("mason-lspconfig").setup_handlers({
		function(server_name)
			local server_options = servers[server_name] or {}

			server_options.capabilities =
				vim.tbl_deep_extend("force", {}, capabilities, server_options.capabilities or {})
			server_options.handlers = common_handlers
			require("lspconfig")[server_name].setup(server_options)
		end,
	})

	require("lspconfig.ui.windows").default_options.border = "rounded"
end
