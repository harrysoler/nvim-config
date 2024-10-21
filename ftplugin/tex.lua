local function map(keys, func, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func)
end

map("<leader>ll", ":VimtexCompile<CR>")
