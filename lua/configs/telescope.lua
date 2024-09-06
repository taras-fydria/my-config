local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
map("n", "<leader>fw", builtin.live_grep, { desc = "Find Word" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Find Tag" })
