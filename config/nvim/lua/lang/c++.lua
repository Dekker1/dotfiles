local lsp_settings = require('comp.lsp')
local nvim_lsp = require('lspconfig')

nvim_lsp.clangd.setup {
	on_attach = lsp_settings.on_attach,
	capabilities = lsp_settings.capabilites,
}
