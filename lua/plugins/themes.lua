return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("solarized-osaka").setup({})
			--vim.cmd.colorscheme("solarized-osaka")
		end,
	},
	{
		"navarasu/onedark.nvim",
		name = "onedark",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "deep",
			})
			vim.cmd.colorscheme("onedark")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
			})
			--vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			--vim.cmd([[colorscheme tokyodark]])
		end,
	},
	{
		"ghifarit53/tokyonight-vim",
		config = function()
			--vim.cmd.colorscheme("tokyonight")
		end,
	},
}
