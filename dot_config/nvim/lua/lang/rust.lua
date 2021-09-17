local lsp_settings = require('support.lsp')
local nvim_lsp = require('lspconfig')

nvim_lsp.rust_analyzer.setup {
	on_attach = lsp_settings.on_attach,
	capabilities = lsp_settings.capabilites,
}

vim.cmd('autocmd Filetype rust setlocal tabstop=4 shiftwidth=4 expandtab')
