local lspconfig = require("lspconfig")
local map = vim.keymap.set
local capabilities = vim.lsp.protocol.make_client_capabilities()
local inlay_hint = vim.lsp.inlay_hint

local on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  -- require("inlay-hints").on_attach(client, bufnr)

  if not inlay_hint.is_enabled() then
    inlay_hint.enable(true, {bufnr = bufnr})
  end

  map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
  map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
  map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
  map("n", "K", vim.lsp.buf.hover, opts("Display code info"))
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Show code actions"))
  map("n", "<leader>fd", vim.diagnostic.open_float, opts("Show float diagnostic"))
  map("n", "<Leader>lr", vim.lsp.buf.rename, opts("Rename"))
end

local on_init = function(client, _)
  if client.supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local function module_exists(name)
  if package.searchpath(name, package.path) then
    return true
  else
    return false
  end
end

local servers = { "html", "cssls", "gitlab_ci_ls", "jsonls", "lua_ls", "ts_ls", "rust_analyzer", "vimls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  print(lsp)
  local lsp_config = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }

  lspconfig[lsp].setup(lsp_config)
end

lspconfig.rust_analyzer.setup({
  filetypes = { "rust" },
  root_dir = function()
    return vim.fn.getcwd()
  end,
  settings = {
    ["rust-analyzer"] = {
      inlayHints = {
        bindingModeHints = {
          enable = false,
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
          minLines = 25,
        },
        closureReturnTypeHints = {
          enable = "never",
        },
        lifetimeElisionHints = {
          enable = "never",
          useParameterNames = false,
        },
        maxLength = 25,
        parameterHints = {
          enable = true,
        },
        reborrowHints = {
          enable = "never",
        },
        renderColons = true,
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
    },
  },
})

lspconfig.ts_ls.setup({
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      hint = {
        enable = true, -- necessary
      },
    },
  },
})
