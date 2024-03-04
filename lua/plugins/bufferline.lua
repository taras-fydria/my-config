return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	version = "*",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				hover = {
					enabled = true,
					delay = 150,
					reveal = { "close" },
				},
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return s
				end,
			},
		})

		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", {})
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {})
	  vim.keymap.set("n", "<leader>-q", ":q<CR>", {}) 
  end,
}
