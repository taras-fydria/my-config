return {
	"nvim-telescope/telescope-ui-select.nvim",
	config = function()
		require("telescope").setup(require("configs.telescope-ui-select"))
		-- To get ui-select loaded and working with telescope, you need to call
		-- load_extension, somewhere after setup function:
		require("telescope").load_extension("ui-select")
	end,
}
