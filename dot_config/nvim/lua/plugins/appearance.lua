-- Colour Scheme configuration
local conf_theme = function()
	local dn = require('dark_notify')
	dn.run({
		schemes = {
			dark = "rose-pine",
			light = "rose-pine",
		},
		onchange = function(mode)
			--Set statusbar
			if mode == "dark" then
				require('rose-pine').set('moon')
			else
				require('rose-pine').set('dawn')
			end
			require("plenary.reload").reload_module("lualine", true)
			require('lualine').setup {
				options = {
					icons_enabled = 0,
					theme = 'rose-pine'
				}
			}
		end,
	})
end

local conf_indent = function()
	vim.g.indent_blankline_char = "┊" -- │ is another good option
	vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
	vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
	vim.g.indent_blankline_char_highlight = 'LineNr'
end

local conf_treesitter = function()
	require'nvim-treesitter.configs'.setup {
		ensure_installed = "maintained",
		highlight = {
			enable = true, -- false will disable the whole extension
		},
	}
end

return {
	conf_theme = conf_theme,
	conf_indent = conf_indent,
	conf_treesitter = conf_treesitter,
}
