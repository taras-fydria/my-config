dofile(vim.g.base46_cache .. "telescope")
local open_with_trouble = require("trouble.sources.telescope").open

local options = {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close, ["<c-t>"] = open_with_trouble },
      i = { ["<c-t>"] = open_with_trouble },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {},
}

return options
