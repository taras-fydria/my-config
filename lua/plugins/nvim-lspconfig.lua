return {
  "neovim/nvim-lspconfig",
  event = "User FilePost",
  config = function()
    require("lua.configs.lspconfig")
  end,
}
