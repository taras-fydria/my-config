-- load defaults i.e lua_lsp

local lspconfig = require "lspconfig"
local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
local on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  require("inlay-hints").on_attach(client, bufnr)

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  map("n", "<leader>ra", function()
    require "nvchad.lsp.renamer"()
  end, opts "NvRenamer")

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
  map("n", "gr", vim.lsp.buf.references, opts "Show references")
end

-- disable semanticTokens
local on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local function module_exists(name)
  if package.searchpath(name, package.path) then
    return true
  else
    return false
  end
end

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

-- EXAMPLE
local servers = { "html", "cssls", "gitlab_ci_ls", "jsonls", "lua_ls", "tsserver", "rust_analyzer" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  local lsp_config = {}
  if module_exists("configs.lsp." .. lsp) then
    lsp_config = require("configs.lsp." .. lsp)
  else
    lsp_config = {}
  end

  lsp_config.on_attach = on_attach
  lsp_config.on_init = on_init
  lsp_config.capabilities = capabilities

  lspconfig[lsp].setup(lsp_config)
end
