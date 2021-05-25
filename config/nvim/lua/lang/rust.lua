local lsp_settings = require('lang.lsp')
local nvim_lsp = require('lspconfig')

nvim_lsp['rust_analyzer'].setup { on_attach = lsp_settings.on_attach }

vim.cmd('autocmd Filetype rust setlocal tabstop=4 shiftwidth=4 expandtab')
