vim.g.mapleader = " "

vim.keymap.set("n", "<leader>dd", function()
	vim.diagnostic.open_float()
end)

-- Ctrl+v is taken! Visual block must go elsewhere
vim.keymap.set("n", "<A-v>", "<C-v>", { noremap = true })
