return {
  "neovim/nvim-lspconfig",
  event = "User FilePost",
  opts = {
    inlay_hints = { enabled = true },
  },
  config = function()
    require "configs.lspconfig"
  end,
}
