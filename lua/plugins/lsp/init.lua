local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local function attach_lsp_callback(callback)
	autocmd("LspAttach", {
		group = autogroup("kickstart-lsp-attach", { clear = true }),
		callback = callback,
	})
end

return {
    {
        -- Lua Language Server
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' }},
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "Mason", "LspInfo", "LspInstall", "LspUninstall" },
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            'mason-org/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            { 'j-hui/fidget.nvim', opts = {} },

            'saghen/blink.cmp',
        },
        opts = {
            -- Here lay servers without specified config, if need one with custom config then add it to servers folder
            servers = {
                "rust-analyzer",
                "vtsls",
            },
            tools = {
                "stylua",
                "latexindent",
                "bibtex-tidy",
                "csharpier",
            },
        },
        config = function(_, opts)
            attach_lsp_callback(function(event)
                require("plugins.lsp.mappings")

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                require("plugins.lsp.highlight_hints")(client, event)
                require("plugins.lsp.inlay_hints")(client, event)
            end)

            require("plugins.lsp.diagnostics")

            local servers = require("plugins.lsp.servers")

            print(vim.inspect(opts.servers))

            require("plugins.lsp.cmp")(servers, opts)
        end
    }
}
