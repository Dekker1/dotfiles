local lsp_settings = require('lang.lsp')
local nvim_lsp = require('lspconfig')

nvim_lsp['gopls'].setup { on_attach = lsp_settings.on_attach }

vim.cmd('autocmd Filetype go setlocal tabstop=4 shiftwidth=4')
