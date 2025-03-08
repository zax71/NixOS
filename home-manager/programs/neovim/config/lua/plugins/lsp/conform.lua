return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				toml = { "taplo" },
				yaml = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				graphql = { { "prettierd", "prettier" } },
				liquid = { { "prettierd", "prettier" } },

				nix = { "nixfmt" },
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				go = { "gofumpt" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout = 500,
			},
		})
	end,
}
