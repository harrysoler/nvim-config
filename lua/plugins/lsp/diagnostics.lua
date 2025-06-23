local diagnostic = vim.diagnostic

diagnostic.config {
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = diagnostic.severity.ERROR },
    signs = vim.g.have_nerd_font and {
        text = {
            [diagnostic.severity.ERROR] = '󰅚 ',
            [diagnostic.severity.WARN] = '󰀪 ',
            [diagnostic.severity.INFO] = '󰋽 ',
            [diagnostic.severity.HINT] = '󰌶 ',
        },
    } or {},
    virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(received_diagnostic)
            local diagnostic_message = {
                [diagnostic.severity.ERROR] = received_diagnostic.message,
                [diagnostic.severity.WARN] = received_diagnostic.message,
                [diagnostic.severity.INFO] = received_diagnostic.message,
                [diagnostic.severity.HINT] = received_diagnostic.message,
            }
            return diagnostic_message[received_diagnostic.severity]
        end,
    },
}
