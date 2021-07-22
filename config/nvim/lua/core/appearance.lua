--Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Softwrap settings
vim.opt.breakindent = true
vim.opt.showbreak = "↪  "
vim.opt.linebreak = true

--Map blankline
vim.g.indent_blankline_char = "│" -- ┊ is another good option
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'

-- Change preview window location
vim.g.splitbelow = true

-- Highlight on yank
vim.api.nvim_exec([[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
]], false)

-- Colour Scheme configuration
local dn = require('dark_notify')
dn.run({
	schemes = {
		dark  = {
			colorscheme = "tokyonight",
			background = "dark",
		},
		light = {
			colorscheme = "papercolor",
			background = "light",
		}
	},
	onchange = function(mode)
		--Set statusbar
		if mode == "dark" then
			require("plenary.reload").reload_module("lualine", true)
			require('lualine').setup {
				options = {
					icons_enabled = 0,
					theme = 'tokyonight'
				}
			}
		else
			require("plenary.reload").reload_module("lualine", true)
			require('lualine').setup {
				options = {
					icons_enabled = 0,
					theme = 'papercolor'
				}
			}
		end
	end,
})
