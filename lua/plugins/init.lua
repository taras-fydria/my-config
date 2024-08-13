return {
  "nvim-lua/plenary.nvim",
  require "plugins.NvChad-base46",
  require "plugins.nvchad-ui",
  require "plugins.nvim-web-devicons",
  require "plugins.indent-blankline",

  -- file managing , picker etc
  require "plugins.nvim-tree",
  require "plugins.which-key",

  -- formatting!
  require "plugins.conform",

  -- git stuff
  require "plugins.gitsigns",

  -- lsp stuff
  require "plugins.mason",
  require "plugins.nvim-lspconfig",
  require "plugins.inlay-hints",

  -- load luasnips + cmp related in insert mode only
  require "plugins.nvim-cmp",
  require "plugins.telescope",
  require "plugins.nvim-colorizer",
  require "plugins.treesitter",
  require "plugins.trouble",
  -- {
  -- "stevearc/conform.nvim",
  -- event = 'BufWritePre', -- uncomment for format on save
  --   opts = require "configs.conform",
  -- },
  --
  -- -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "configs.lspconfig"
  --   end,
  -- },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
