vim.g.mapleader = " "

vim.keymap.set("n", "<leader>dd", function()
	vim.diagnostic.open_float()
end)

