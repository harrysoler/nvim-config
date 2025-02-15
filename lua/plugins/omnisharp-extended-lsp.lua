return {
	"Hoffs/omnisharp-extended-lsp.nvim",
    keys = {
        { "gd", "<cmd>lua require('omnisharp_extended').lsp_definition()<cr>" },
        { "<leader>D", "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>" },
    }
}
