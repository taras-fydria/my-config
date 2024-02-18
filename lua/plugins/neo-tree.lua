return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        enable_git_status = true,
      })
      vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>', {})
      vim.keymap.set('n', '<leader>-e', ':Neotree filesystem focus left<CR>', {})
    end
  },
  {
    "DaikyXendo/nvim-material-icon",
    config = function()
      require("nvim-material-icon").setup({
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
          }
        },
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true,
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true,
      })
    end
  }
}
