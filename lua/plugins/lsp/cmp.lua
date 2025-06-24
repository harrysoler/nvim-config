return function(servers)
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    require("lazy-lsp").setup {
        excluded_servers = {
            "ccls",
            "denols",
            "docker_compose_language_service",
            "flow",
            "ltex",
            "quick_lint_js",
            "scry",
            "tailwindcss",
            "biome",
            "oxlint",
        },
        preferred_servers = {
            markdown = {},
            python = { "basedpyright", "ruff" },
            rust = { "rust_analyzer" },
        },
        default_config = {
            capabilities = capabilities,
        },
        configs = servers
    }

    require("lspconfig.ui.windows").default_options.border = "rounded"
end
