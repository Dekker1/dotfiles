-- Configure nvim-cmp
local conf_cmp = function()
	local cmp = require('cmp')
	cmp.setup({
	  snippet = {
		expand = function(args)
		  vim.fn["vsnip#anonymous"](args.body)
		end,
	  },
	  mapping = {
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
	  },
	  sources = {
		{ name = 'buffer' },
		{ name = 'crates' },
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'path' },
	  }
	})
end

return { conf_cmp = conf_cmp }