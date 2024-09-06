local map = vim.keymap.set
local toggleInlayHints = function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

map("n", "<leader>rn", "<cmd>IncRename", {desc = "IncRename"})
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save File" })
map("n", "<leader>wa", "<cmd>wall<CR>")
map("n", "<leader>h", toggleInlayHints, { desc = "Toggle Inlay Hints" })
