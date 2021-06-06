-- Incremental live completion
vim.opt.inccommand = "nosplit"

-- Do not save when switching buffers
vim.opt.hidden = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

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
vim.opt.spell = true
vim.opt.spelllang = "en_au,nl"

-- "gw" does not use latexindent
vim.g.latexindent = false
