local lspconfig = require("lspconfig")
local map = vim.keymap.set
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local nvim = require("nvim")

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client.server_capabilities.inlayHintProvider then
--       vim.lsp.inlay_hint.enable(args.buf, true)
--     end
--     -- whatever other lsp config you want
--   end,
-- })

local on_attach = function(client, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
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
	local buffer = nvim.get_current_buffer()
	vim.lsp.inlay_hint.enable(buffer, true)

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
