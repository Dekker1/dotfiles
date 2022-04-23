local lsp_settings = require('support.lsp')
local nvim_lsp = require('lspconfig')

nvim_lsp.svelte.setup {
	on_attach = lsp_settings.on_attach,
	capabilities = lsp_settings.capabilites,
	filetypes = { "javascript", "typescript", "svelte" }
}
