-- Incremental live completion
vim.opt.inccommand = "nosplit"

-- Do not save when switching buffers
vim.opt.hidden = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Use system clipboard
vim.opt.clipboard:prepend {"unnamedplus"}

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
	if vim.opt.mouse == 'a' then
		vim.cmd[[IndentBlanklineDisable]]
		vim.opt.signcolumn='no'
		vim.opt.mouse = 'v'
		vim.opt.number = false
		print("Mouse disabled")
	else
		vim.cmd[[IndentBlanklineEnable]]
		vim.opt.signcolumn='yes'
		vim.opt.mouse = 'a'
		vim.opt.number = true
		print("Mouse enabled")
	end
end

vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<cr>', { noremap = true })

-- Save undo history
vim.cmd[[set undofile]]

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.signcolumn="yes"

-- Remap escape to leave terminal mode
vim.api.nvim_exec([[
	augroup Terminal
		autocmd!
		au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
		au TermOpen * set nonu
	augroup end
]], false)

-- Enable spellcheck
-- vim.opt.spell = true
vim.opt.spelllang = "en_au,nl"

--Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Softwrap settings
vim.opt.breakindent = true
vim.opt.showbreak = "↪  "
vim.opt.linebreak = true

-- Change preview window location
vim.g.splitbelow = true

-- Highlight on yank
vim.api.nvim_exec([[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
]], false)

-- Start search when you start typing
vim.opt.incsearch = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Default indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.expandtab = false

-- Code Folding
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt.foldminlines = 5
-- vim.opt.foldnestmax = 2

-- Save when lost focus
vim.cmd('au FocusLost * silent! wa')

-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
vim.cmd([[
	augroup format
		autocmd!
		autocmd BufWritePre * :Format
	augroup END
]])

vim.cmd([[ autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%" ]])
