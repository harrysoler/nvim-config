local function map(keys, func, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func)
end
local g = vim.g
local opt = vim.opt

-- Set leader key
g.mapleader = " "
g.maplocalleader = " "

-- Search highlighting
opt.hlsearch = true
map("<Esc>", "<cmd>nohlsearch<CR>")

-- Sublines
map("j", "gj")
map("k", "gk")

-- Clipboard
map("<leader>y", '"+y')
map("<leader>y", '"+y', "v")
map("<leader>Y", '"+Y')

-- Diagnostic keymaps
map("[d", vim.diagnostic.goto_prev)
map("]d", vim.diagnostic.goto_next)
map("<leader>e", vim.diagnostic.open_float)
map("<leader>q", vim.diagnostic.setloclist)

-- Move focus
map("<C-h>", "<C-w><C-h>")
map("<C-l>", "<C-w><C-l>")
map("<C-j>", "<C-w><C-j>")
map("<C-k>", "<C-w><C-k>")

-- Window resize
map("<C-left>", ":vertical resize +3<CR>")
map("<C-left>", ":vertical resize +3<CR>")
map("<C-up>", ":horizontal resize +3<CR>")
map("<C-down>", ":horizontal resize -3<CR>")

-- Center cursor on scroll
map("<C-d>", "<C-d>zz")
map("<C-u>", "<C-u>zz")
