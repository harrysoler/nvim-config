local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local function attach_lsp_callback(callback)
	autocmd("LspAttach", {
		group = autogroup("kickstart-lsp-attach", { clear = true }),
		callback = callback,
	})
end

return {
	"neovim/nvim-lspconfig",
	event = "BufReadPost",
	cmd = { "Mason" },
	dependencies = {
		-- Mason
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Bottom right notifications
		{ "j-hui/fidget.nvim", opts = {} },

		-- Autocompletion
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		servers = {
			"rust_analyzer",
		},
		tools = {
			"stylua",
		},
	},
	config = function(_, opts)
		attach_lsp_callback(function(event)
			require("plugins.lsp.mappings")

			-- Setup autocmds
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			require("plugins.lsp.highlight_hints")(client, event)
			require("plugins.lsp.inlay_hints")(client, event)
		end)

		local folder_servers = require("plugins.lsp.servers")
		require("plugins.lsp.mason")(folder_servers, opts)
	end,
}
