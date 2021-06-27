-- Default indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.expandtab = false

-- Automatic resizing on focus
local focus = require('focus')
focus.height = 40

-- Save when lost focus
vim.cmd('au FocusLost * silent! wa')
