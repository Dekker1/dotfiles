-- Default indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.expandtab = false

-- Save when lost focus
vim.cmd('au FocusLost * silent! wa')
