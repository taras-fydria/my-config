return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup(require("configs.lualine"))
	end,
}
