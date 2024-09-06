return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = { "typescript-language-server", "vim", "vimdoc" },
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			require("configs.lsp")
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup({})
		end,
	},
}
