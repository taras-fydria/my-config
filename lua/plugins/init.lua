return {
	--UI
	require("alpha-nvim"),
	require("plugins.bufferline"),
	require("lualine"),
	require("neo-tree"),
	require("nvim-material-icons"),
	require("noice"),
	require("telescope"),
	require("telescope-ui-select"),

	-- Editor stuff
	require("plugins.comments"),
	require("treesitter"),
	require("none-ls"),
	-- Additional staff
	require("which-key"),
}
