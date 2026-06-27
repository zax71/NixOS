return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	init = function()
		vim.g.vimtex_view_general_viewer = "okular"
		vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"

		vim.g.vimtex_quickfix_ignore_filters = { "Underfull", "Overfull" }

		vim.g.vimtex_compiler_latexmk = {
			callback = 1,
			continuous = 1,
			executable = "latexmk",
			options = {
				"-shell-escape",
				"-interaction=nonstopmode",
				"-pdf",
				"-lualatex",
			},
			aux_dir = "/home/zax/.texfiles",
			out_dir = "/home/zax/.texfiles",
		}
	end,
}
