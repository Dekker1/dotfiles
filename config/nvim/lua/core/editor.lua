-- Default indentation
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.smartindent = true
vim.bo.expandtab = false

-- Save when lost focus
vim.cmd('au FocusLost * silent! wa')
