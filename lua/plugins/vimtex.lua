return {
	"lervag/vimtex",
	ft = { "tex", "bib" },
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compiler_latexmk = {
			aux_dir = "build",
			options = {
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}
		vim.g.vimtex_view_forward_search_on_start = 0
	end,
}
